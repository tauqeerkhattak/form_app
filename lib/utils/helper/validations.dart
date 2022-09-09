import 'dart:developer';

class Validator {}

String? getValidator(String? value, String? validator) {
  if (value != null && validator != null && validator != '') {
    validator = validator.split('regex:').last;
    validator = validator.substring(0, validator.length - 1);
    log('Validator: $validator');
    return validator;
  }
  return null;
}
