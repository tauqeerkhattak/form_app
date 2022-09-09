import 'package:flutter/material.dart';
import 'package:form_app/domain/controllers/home_controller.dart';
import 'package:form_app/domain/models/form_model.dart';
import 'package:form_app/utils/app_colors.dart';
import 'package:form_app/utils/helper/validations.dart';
import 'package:form_app/widgets/custom_error.dart';
import 'package:form_app/widgets/custom_text.dart';
import 'package:form_app/widgets/default_layout.dart';
import 'package:form_app/widgets/input_field.dart';
import 'package:form_app/widgets/widgets_uril.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final controller = Get.find<HomeController>();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Form',
      child: Obx(() {
        if (controller.loading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                AppColors.primary,
              ),
            ),
          );
        } else if (controller.form.value == null) {
          return Center(
            child: CustomError(
              errorText: 'Error loading form!',
              onTap: () async {
                await controller.getForm();
              },
            ),
          );
        }
        return SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(
                  controller.form.value?.data?.length ?? 0,
                  (index) {
                    Data form = controller.form.value!.data![index];
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 7,
                        bottom: 7,
                      ),
                      child: getFormField(form),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.key.currentState!.validate()) {
                      Get.rawSnackbar(
                        message: "Validated",
                      );
                    } else {
                      Get.rawSnackbar(
                        message: "Validated",
                      );
                    }
                  },
                  child: CustomText(
                    text: 'Submit',
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget getFormField(Data data) {
    MainForm form = data.mainForm!;
    switch (form.type) {
      case InputType.number:
        return _inputField(form, data.subForm!);
      case InputType.text:
        return _inputField(form, data.subForm!);
      case null:
        return const SizedBox();
    }
  }

  Widget _inputField(MainForm form, List<SubForm> subForms) {
    RxBool isSubFormVisible = true.obs;
    final controller = TextEditingController(text: form.defaultValue);
    return Column(
      children: [
        InputField(
          validator: (value) {
            final regex = getValidator('', form.validations);
            if (RegExp(regex!).hasMatch(value!)) {
              return 'Please enter a valid value';
            }
            return null;
          },
          controller: controller,
          label: form.label,
          placeHolder: form.placeHolder,
          inputType: TextInputType.number,
          onChanged: (value) {
            if (value.isNotEmpty) {
              isSubFormVisible.value = true;
            } else {
              isSubFormVisible.value = false;
            }
          },
        ),
        if (subForms.isNotEmpty)
          Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isSubFormVisible.value
                  ? ExpansionTile(
                      title: const CustomText(
                        text: 'Family Info',
                        size: 18,
                        color: Colors.black,
                      ),
                      initiallyExpanded: true,
                      childrenPadding: const EdgeInsets.all(10),
                      backgroundColor: AppColors.primary.withOpacity(0.3),
                      children: List.generate(
                        num.parse(controller.text).toInt(),
                        (_) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WidgetsUtil.spaceV10,
                              CustomText(
                                text: '${_ + 1}.',
                                size: 42,
                                color: AppColors.white,
                                weight: FontWeight.bold,
                              ),
                              WidgetsUtil.spaceV10,
                              ...List.generate(
                                subForms.length,
                                (index) {
                                  SubForm subForm = subForms[index];
                                  final controller = TextEditingController(
                                    text: subForm.defaultValue,
                                  );
                                  return InputField(
                                    controller: controller,
                                    label: subForm.label,
                                    placeHolder: subForm.placeHolder,
                                  );
                                },
                              )
                            ],
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
      ],
    );
  }
}
