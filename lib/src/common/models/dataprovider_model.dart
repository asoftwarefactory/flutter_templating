import 'dart:convert';
import 'template.dart';

List<DataproviderModel> dataprovidersModelFromList(List data) =>
    List<DataproviderModel>.from(
        data.map((x) => DataproviderModel.fromJson(x)));

List<DataproviderModel> dataprovidersModelFromJson(String str) =>
    List<DataproviderModel>.from(
        json.decode(str).map((x) => DataproviderModel.fromJson(x)));

String dataprovidersModelToJson(List<DataproviderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataproviderModel {
  final List<DataproviderModelPut>? inputs;
  final List<DataproviderModelPut>? outputs;
  final String? name;
  final String? label;
  final String? backofficeUrl;
  final String? publicUrl;
  final DataProviderTypes? type;

  DataproviderModel({
    this.inputs,
    this.outputs,
    this.name,
    this.label,
    this.backofficeUrl,
    this.publicUrl,
    this.type,
  });

  DataproviderModel copyWith({
    List<DataproviderModelPut>? inputs,
    List<DataproviderModelPut>? outputs,
    String? name,
    String? label,
    String? backofficeUrl,
    String? publicUrl,
    DataProviderTypes? type,
  }) =>
      DataproviderModel(
        inputs: inputs ?? this.inputs,
        outputs: outputs ?? this.outputs,
        name: name ?? this.name,
        label: label ?? this.label,
        backofficeUrl: backofficeUrl ?? this.backofficeUrl,
        publicUrl: publicUrl ?? this.publicUrl,
        type: type ?? this.type,
      );

  factory DataproviderModel.fromJson(Map<String, dynamic> json) =>
      DataproviderModel(
        inputs: json["inputs"] == null
            ? []
            : List<DataproviderModelPut>.from(
                json["inputs"]!.map((x) => DataproviderModelPut.fromJson(x))),
        outputs: json["outputs"] == null
            ? []
            : List<DataproviderModelPut>.from(
                json["outputs"]!.map((x) => DataproviderModelPut.fromJson(x))),
        name: json["name"],
        label: json["label"],
        backofficeUrl: json["backofficeUrl"],
        publicUrl: json["publicUrl"],
        type: dataProviderTypesValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "inputs": inputs == null
            ? []
            : List<dynamic>.from(inputs!.map((x) => x.toJson())),
        "outputs": outputs == null
            ? []
            : List<dynamic>.from(outputs!.map((x) => x.toJson())),
        "name": name,
        "label": label,
        "backofficeUrl": backofficeUrl,
        "publicUrl": publicUrl,
        "type": dataProviderTypesValues.reverse[type],
      };
}

class DataproviderModelPut {
  final bool? required;
  final String? name;
  final String? label;
  final FieldTypes? type;
  final bool? isArray;

  DataproviderModelPut({
    this.required,
    this.name,
    this.label,
    this.type,
    this.isArray,
  });

  DataproviderModelPut copyWith({
    bool? required,
    String? name,
    String? label,
    FieldTypes? type,
    bool? isArray,
  }) =>
      DataproviderModelPut(
        required: required ?? this.required,
        name: name ?? this.name,
        label: label ?? this.label,
        type: type ?? this.type,
        isArray: isArray ?? this.isArray,
      );

  factory DataproviderModelPut.fromJson(Map<String, dynamic> json) =>
      DataproviderModelPut(
        required: json["required"],
        name: json["name"],
        label: json["label"],
        type: fieldTypesValues.map[json["type"]],
        isArray: json["isArray"],
      );

  Map<String, dynamic> toJson() => {
        "required": required,
        "name": name,
        "label": label,
        "type": fieldTypesValues.reverse[type],
        "isArray": isArray,
      };
}
