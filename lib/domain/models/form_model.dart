import 'package:form_app/utils/helper/enum_help.dart';

enum InputType { number, text }

class FormModel {
  int? status;
  List<Data>? formData;

  FormModel({this.status, this.formData});

  FormModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['form'] != null) {
      formData = <Data>[];
      json['form'].forEach((v) {
        formData!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (formData != null) {
      data['form'] = formData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  MainForm? form;
  List<SubForm>? subForm;

  Data({this.id, this.form, this.subForm});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    form = json['form'] != null ? MainForm.fromJson(json['form']) : null;
    if (json['sub_form'] != null) {
      subForm = <SubForm>[];
      json['sub_form'].forEach((v) {
        subForm!.add(SubForm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (form != null) {
      data['form'] = form!.toJson();
    }
    if (subForm != null) {
      data['sub_form'] = subForm!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainForm {
  int? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? formRefId;
  String? label;
  InputType? type;
  String? isRequired;
  String? defaultValue;
  String? placeHolder;
  String? validations;

  MainForm(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.formRefId,
      this.label,
      this.type,
      this.isRequired,
      this.defaultValue,
      this.placeHolder,
      this.validations});

  MainForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    formRefId = json['form_ref_id'];
    label = json['label'];
    type = getInputType(json['type']);
    isRequired = json['is_required'];
    defaultValue = json['default_value'];
    placeHolder = json['place_holder'];
    validations = json['validations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['form_ref_id'] = formRefId;
    data['label'] = label;
    data['type'] = type;
    data['is_required'] = isRequired;
    data['default_value'] = defaultValue;
    data['place_holder'] = placeHolder;
    data['validations'] = validations;
    return data;
  }
}

class SubForm {
  int? id;
  int? parentFieldId;
  String? label;
  InputType? type;
  String? isRequired;
  String? defaultValue;
  String? placeHolder;
  String? validation;
  String? createdAt;
  String? updatedAt;

  SubForm(
      {this.id,
      this.parentFieldId,
      this.label,
      this.type,
      this.isRequired,
      this.defaultValue,
      this.placeHolder,
      this.validation,
      this.createdAt,
      this.updatedAt});

  SubForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentFieldId = json['parent_field_id'];
    label = json['label'];
    type = getInputType(json['type']);
    isRequired = json['is_required'];
    defaultValue = json['default_value'];
    placeHolder = json['place_holder'];
    validation = json['validation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_field_id'] = parentFieldId;
    data['label'] = label;
    data['type'] = type;
    data['is_required'] = isRequired;
    data['default_value'] = defaultValue;
    data['place_holder'] = placeHolder;
    data['validation'] = validation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
