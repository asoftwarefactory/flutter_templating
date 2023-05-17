import 'dart:convert';

import 'template.dart';

List<AutocompleteModel> autocompletesModelFromList(List list) =>
    List<AutocompleteModel>.from(
        (list).map((x) => AutocompleteModel.fromJson(x)));

List<AutocompleteModel> autocompletesModelFromJson(String str) =>
    List<AutocompleteModel>.from(
        json.decode(str).map((x) => AutocompleteModel.fromJson(x)));

String autocompletesModelToJson(List<AutocompleteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AutocompleteModel {
  final List<AutocompleteModelInput>? inputs;
  final FieldTypes? outputFieldType;
  final String? name;
  final String? label;
  final String? backofficeUrl;
  final String? publicUrl;

  AutocompleteModel({
    this.inputs,
    this.outputFieldType,
    this.name,
    this.label,
    this.backofficeUrl,
    this.publicUrl,
  });

  AutocompleteModel copyWith({
    List<AutocompleteModelInput>? inputs,
    FieldTypes? outputFieldType,
    String? name,
    String? label,
    String? backofficeUrl,
    String? publicUrl,
  }) =>
      AutocompleteModel(
        inputs: inputs ?? this.inputs,
        outputFieldType: outputFieldType ?? this.outputFieldType,
        name: name ?? this.name,
        label: label ?? this.label,
        backofficeUrl: backofficeUrl ?? this.backofficeUrl,
        publicUrl: publicUrl ?? this.publicUrl,
      );

  factory AutocompleteModel.fromJson(Map<String, dynamic> json) =>
      AutocompleteModel(
        inputs: json["inputs"] == null
            ? []
            : List<AutocompleteModelInput>.from(
                json["inputs"]!.map((x) => AutocompleteModelInput.fromJson(x))),
        outputFieldType: fieldTypesValues.map[json["outputFieldType"]],
        name: json["name"],
        label: json["label"],
        backofficeUrl: json["backofficeUrl"],
        publicUrl: json["publicUrl"],
      );

  Map<String, dynamic> toJson() => {
        "inputs": inputs == null
            ? []
            : List<dynamic>.from(inputs!.map((x) => x.toJson())),
        "outputFieldType": fieldTypesValues.reverse[outputFieldType],
        "name": name,
        "label": label,
        "backofficeUrl": backofficeUrl,
        "publicUrl": publicUrl,
      };
}

class AutocompleteModelInput {
  final String? name;
  final String? label;
  final FieldTypes? type;
  final bool? isArray;
  final bool? required;

  AutocompleteModelInput({
    this.name,
    this.label,
    this.type,
    this.isArray,
    this.required,
  });

  AutocompleteModelInput copyWith({
    String? name,
    String? label,
    FieldTypes? type,
    bool? isArray,
    bool? required,
  }) =>
      AutocompleteModelInput(
        name: name ?? this.name,
        label: label ?? this.label,
        type: type ?? this.type,
        isArray: isArray ?? this.isArray,
        required: required ?? this.required,
      );

  factory AutocompleteModelInput.fromJson(Map<String, dynamic> json) =>
      AutocompleteModelInput(
        name: json["name"],
        label: json["label"],
        type: fieldTypesValues.map[json["type"]],
        isArray: json["isArray"],
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "type": fieldTypesValues.reverse[type],
        "isArray": isArray,
        "required": required,
      };
}
