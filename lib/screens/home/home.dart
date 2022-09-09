import 'package:flutter/material.dart';
import 'package:form_app/domain/controllers/home_controller.dart';
import 'package:form_app/domain/models/form_model.dart';
import 'package:form_app/utils/app_colors.dart';
import 'package:form_app/widgets/custom_error.dart';
import 'package:form_app/widgets/default_layout.dart';
import 'package:form_app/widgets/input_field.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              controller.form.value!.formData!.length,
              (index) {
                Data form = controller.form.value!.formData![index];
                return Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: getFormField(form),
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Widget getFormField(Data data) {
    MainForm form = data.form!;
    switch (data.form!.type) {
      case InputType.number:
        return InputField(
          label: form.label,
          placeHolder: form.placeHolder,
          inputType: TextInputType.number,
        );
      case InputType.text:
        return InputField(
          label: form.label,
          placeHolder: form.placeHolder,
        );
      case null:
        return const SizedBox();
    }
  }
}
