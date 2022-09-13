import 'dart:developer';

class Validator {}

String? getValidator(String? value, String? validator) {
  if (validator == null || validator == '') {
    return null;
  } else if (validator != '') {
    validator = validator.split('regex:').last;
    validator = validator.substring(0, validator.length - 1);
    final regExp = RegExp(r'' + validator);
    log('Validator: $validator $value');
    if (value == null || value == '') {
      return 'Cannot be null';
    } else if (regExp.hasMatch(value)) {
      return 'Please enter valid data';
    }
    return null;
  }
  return null;
}
