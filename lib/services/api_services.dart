import 'dart:convert';

import 'package:form_app/domain/api.dart';
import 'package:form_app/domain/models/form_model.dart';
import 'package:form_app/utils/network.dart';
import 'package:form_app/utils/ui_utils.dart';

class ApiServices {
  static Future<FormModel?> getForm() async {
    final res = await Network.get(url: Api.form);
    if (res != null) {
      FormModel model = FormModel.fromJson(jsonDecode(res));
      if (model.status == 200) {
        return model;
      } else {
        UiUtils.showSnackbar(
          message: 'Unknown error, please try again!',
        );
      }
    }
    return null;
  }
}
