import 'dart:convert';

List<BaseAutocomplete> baseAutocompletesFromList(List list) =>
    List<BaseAutocomplete>.from(
        (list).map((x) => BaseAutocomplete.fromJson(x)));

List<BaseAutocomplete> baseAutocompleteFromJson(String str) =>
    List<BaseAutocomplete>.from(
        json.decode(str).map((x) => BaseAutocomplete.fromJson(x)));

String baseAutocompleteToJson(List<BaseAutocomplete> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BaseAutocomplete {
  final List<Input>? inputs;
  final String? outputFieldType;
  final String? name;
  final String? label;
  final String? backofficeUrl;
  final String? publicUrl;

  BaseAutocomplete({
    this.inputs,
    this.outputFieldType,
    this.name,
    this.label,
    this.backofficeUrl,
    this.publicUrl,
  });

  BaseAutocomplete copyWith({
    List<Input>? inputs,
    String? outputFieldType,
    String? name,
    String? label,
    String? backofficeUrl,
    String? publicUrl,
  }) =>
      BaseAutocomplete(
        inputs: inputs ?? this.inputs,
        outputFieldType: outputFieldType ?? this.outputFieldType,
        name: name ?? this.name,
        label: label ?? this.label,
        backofficeUrl: backofficeUrl ?? this.backofficeUrl,
        publicUrl: publicUrl ?? this.publicUrl,
      );

  factory BaseAutocomplete.fromJson(Map<String, dynamic> json) =>
      BaseAutocomplete(
        inputs: json["inputs"] == null
            ? []
            : List<Input>.from(json["inputs"]!.map((x) => Input.fromJson(x))),
        outputFieldType: json["outputFieldType"],
        name: json["name"],
        label: json["label"],
        backofficeUrl: json["backofficeUrl"],
        publicUrl: json["publicUrl"],
      );

  Map<String, dynamic> toJson() => {
        "inputs": inputs == null
            ? []
            : List<dynamic>.from(inputs!.map((x) => x.toJson())),
        "outputFieldType": outputFieldType,
        "name": name,
        "label": label,
        "backofficeUrl": backofficeUrl,
        "publicUrl": publicUrl,
      };
}

class Input {
  final String? name;
  final String? label;
  final String? type;
  final bool? isArray;
  final bool? required;

  Input({
    this.name,
    this.label,
    this.type,
    this.isArray,
    this.required,
  });

  Input copyWith({
    String? name,
    String? label,
    String? type,
    bool? isArray,
    bool? required,
  }) =>
      Input(
        name: name ?? this.name,
        label: label ?? this.label,
        type: type ?? this.type,
        isArray: isArray ?? this.isArray,
        required: required ?? this.required,
      );

  factory Input.fromJson(Map<String, dynamic> json) => Input(
        name: json["name"],
        label: json["label"],
        type: json["type"],
        isArray: json["isArray"],
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "type": type,
        "isArray": isArray,
        "required": required,
      };
}
