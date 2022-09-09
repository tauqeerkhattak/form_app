import 'package:form_app/domain/models/form_model.dart';

InputType? getInputType(String? type) {
  if (type == null || type == '') {
    return null;
  }
  return InputType.values.byName(type);
}
