import 'package:flutter/material.dart';
import 'package:form_app/domain/models/form_model.dart';
import 'package:form_app/services/api_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  final key = GlobalKey<FormState>();
  Rxn<FormModel> form = Rxn();

  @override
  void onInit() {
    super.onInit();
    getForm();
  }

  Future<void> getForm() async {
    loading.value = true;
    final temp = await ApiServices.getForm();
    loading.value = false;
    form.value = temp;
  }
}
