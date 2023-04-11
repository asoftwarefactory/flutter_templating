// To parse this JSON data, do
//
//     final template = templateFromJson(jsonString);

import 'dart:convert';

Template templateFromJson(String str) => Template.fromJson(json.decode(str));

String templateToJson(Template data) => json.encode(data.toJson());

class Template {
  Template({
    this.id,
    this.groupId,
    this.createdAt,
    this.isValid,
    this.scopes,
    this.names,
    this.descriptions,
    this.sections,
    this.enabledIfRules,
    this.dataProviders,
    this.steps,
    this.name,
  });

  final String? id;
  final String? groupId;
  final DateTime? createdAt;
  final bool? isValid;
  final List<String>? scopes;
  final List<Description>? names;
  final List<Description>? descriptions;
  final List<Section>? sections;
  final List<EnabledIfRule>? enabledIfRules;
  final List<DataProvider>? dataProviders;
  final List<Step>? steps;
  final String? name;

  Template copyWith({
    String? id,
    String? groupId,
    DateTime? createdAt,
    bool? isValid,
    List<String>? scopes,
    List<Description>? names,
    List<Description>? descriptions,
    List<Section>? sections,
    List<EnabledIfRule>? enabledIfRules,
    List<DataProvider>? dataProviders,
    List<Step>? steps,
    String? name,
  }) =>
      Template(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        createdAt: createdAt ?? this.createdAt,
        isValid: isValid ?? this.isValid,
        scopes: scopes ?? this.scopes,
        names: names ?? this.names,
        descriptions: descriptions ?? this.descriptions,
        sections: sections ?? this.sections,
        enabledIfRules: enabledIfRules ?? this.enabledIfRules,
        dataProviders: dataProviders ?? this.dataProviders,
        steps: steps ?? this.steps,
        name: name ?? this.name,
      );

  factory Template.fromJson(Map<String, dynamic> json) => Template(
        id: json["id"],
        groupId: json["groupId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        isValid: json["isValid"],
        scopes: json["scopes"] == null
            ? []
            : List<String>.from(json["scopes"]!.map((x) => x)),
        names: json["names"] == null
            ? []
            : List<Description>.from(
                json["names"]!.map((x) => Description.fromJson(x))),
        descriptions: json["descriptions"] == null
            ? []
            : List<Description>.from(
                json["descriptions"]!.map((x) => Description.fromJson(x))),
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromJson(x))),
        enabledIfRules: json["enabledIfRules"] == null
            ? []
            : List<EnabledIfRule>.from(
                json["enabledIfRules"]!.map((x) => EnabledIfRule.fromJson(x))),
        dataProviders: json["dataProviders"] == null
            ? []
            : List<DataProvider>.from(
                json["dataProviders"]!.map((x) => DataProvider.fromJson(x))),
        steps: json["steps"] == null
            ? []
            : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "groupId": groupId,
        "createdAt": createdAt?.toIso8601String(),
        "isValid": isValid,
        "scopes":
            scopes == null ? [] : List<dynamic>.from(scopes!.map((x) => x)),
        "names": names == null
            ? []
            : List<dynamic>.from(names!.map((x) => x.toJson())),
        "descriptions": descriptions == null
            ? []
            : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "sections": sections == null
            ? []
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
        "enabledIfRules": enabledIfRules == null
            ? []
            : List<dynamic>.from(enabledIfRules!.map((x) => x.toJson())),
        "dataProviders": dataProviders == null
            ? []
            : List<dynamic>.from(dataProviders!.map((x) => x.toJson())),
        "steps": steps == null
            ? []
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "name": name,
      };
}

class DataProvider {
  DataProvider({
    this.id,
    this.name,
    this.type,
    this.dataProviderName,
    this.inputs,
    this.outputs,
    this.sectionChildId,
  });

  final String? id;
  final String? name;
  final String? type;
  final String? dataProviderName;
  final List<Put>? inputs;
  final List<Put>? outputs;
  final String? sectionChildId;

  DataProvider copyWith({
    String? id,
    String? name,
    String? type,
    String? dataProviderName,
    List<Put>? inputs,
    List<Put>? outputs,
    String? sectionChildId,
  }) =>
      DataProvider(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        dataProviderName: dataProviderName ?? this.dataProviderName,
        inputs: inputs ?? this.inputs,
        outputs: outputs ?? this.outputs,
        sectionChildId: sectionChildId ?? this.sectionChildId,
      );

  factory DataProvider.fromJson(Map<String, dynamic> json) => DataProvider(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dataProviderName: json["dataProviderName"],
        inputs: json["inputs"] == null
            ? []
            : List<Put>.from(json["inputs"]!.map((x) => Put.fromJson(x))),
        outputs: json["outputs"] == null
            ? []
            : List<Put>.from(json["outputs"]!.map((x) => Put.fromJson(x))),
        sectionChildId: json["sectionChildId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dataProviderName": dataProviderName,
        "inputs": inputs == null
            ? []
            : List<dynamic>.from(inputs!.map((x) => x.toJson())),
        "outputs": outputs == null
            ? []
            : List<dynamic>.from(outputs!.map((x) => x.toJson())),
        "sectionChildId": sectionChildId,
      };
}

class Put {
  Put({
    this.fieldId,
    this.dataProviderFieldName,
  });

  final String? fieldId;
  final String? dataProviderFieldName;

  Put copyWith({
    String? fieldId,
    String? dataProviderFieldName,
  }) =>
      Put(
        fieldId: fieldId ?? this.fieldId,
        dataProviderFieldName:
            dataProviderFieldName ?? this.dataProviderFieldName,
      );

  factory Put.fromJson(Map<String, dynamic> json) => Put(
        fieldId: json["fieldId"],
        dataProviderFieldName: json["dataProviderFieldName"],
      );

  Map<String, dynamic> toJson() => {
        "fieldId": fieldId,
        "dataProviderFieldName": dataProviderFieldName,
      };
}

class Description {
  Description({
    this.culture,
    this.label,
  });

  final String? culture;
  final String? label;

  Description copyWith({
    String? culture,
    String? label,
  }) =>
      Description(
        culture: culture ?? this.culture,
        label: label ?? this.label,
      );

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        culture: json["culture"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "culture": culture,
        "label": label,
      };
}

class EnabledIfRule {
  EnabledIfRule({
    this.id,
    this.name,
    this.conditions,
    this.groupIds,
    this.fieldIds,
  });

  final String? id;
  final String? name;
  final List<Condition>? conditions;
  final List<String>? groupIds;
  final List<String>? fieldIds;

  EnabledIfRule copyWith({
    String? id,
    String? name,
    List<Condition>? conditions,
    List<String>? groupIds,
    List<String>? fieldIds,
  }) =>
      EnabledIfRule(
        id: id ?? this.id,
        name: name ?? this.name,
        conditions: conditions ?? this.conditions,
        groupIds: groupIds ?? this.groupIds,
        fieldIds: fieldIds ?? this.fieldIds,
      );

  factory EnabledIfRule.fromJson(Map<String, dynamic> json) => EnabledIfRule(
        id: json["id"],
        name: json["name"],
        conditions: json["conditions"] == null
            ? []
            : List<Condition>.from(
                json["conditions"]!.map((x) => Condition.fromJson(x))),
        groupIds: json["groupIds"] == null
            ? []
            : List<String>.from(json["groupIds"]!.map((x) => x)),
        fieldIds: json["fieldIds"] == null
            ? []
            : List<String>.from(json["fieldIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "conditions": conditions == null
            ? []
            : List<dynamic>.from(conditions!.map((x) => x.toJson())),
        "groupIds":
            groupIds == null ? [] : List<dynamic>.from(groupIds!.map((x) => x)),
        "fieldIds":
            fieldIds == null ? [] : List<dynamic>.from(fieldIds!.map((x) => x)),
      };
}

class Condition {
  Condition({
    this.fieldId,
    this.constraint,
    this.values,
  });

  final String? fieldId;
  final String? constraint;
  final List<String>? values;

  Condition copyWith({
    String? fieldId,
    String? constraint,
    List<String>? values,
  }) =>
      Condition(
        fieldId: fieldId ?? this.fieldId,
        constraint: constraint ?? this.constraint,
        values: values ?? this.values,
      );

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        fieldId: json["fieldId"],
        constraint: json["constraint"],
        values: json["values"] == null
            ? []
            : List<String>.from(json["values"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "fieldId": fieldId,
        "constraint": constraint,
        "values":
            values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
      };
}

class Section {
  Section({
    this.id,
    this.name,
    this.searchable,
    this.names,
    this.descriptions,
    this.hidden,
    this.fieldType,
    this.isArray,
    this.defaultValue,
    this.validators,
    this.items,
    this.multiple,
    this.children,
    this.type,
    this.workflowFieldId,
  });

  final String? id;
  final String? name;
  final bool? searchable;
  final List<Description>? names;
  final List<Description>? descriptions;
  final bool? hidden;
  final String? fieldType;
  final bool? isArray;
  final String? defaultValue;
  final List<Validator>? validators;
  final List<Item>? items;
  final bool? multiple;
  final List<String>? children;
  final String? type;
  final String? workflowFieldId;

  Section copyWith({
    String? id,
    String? name,
    bool? searchable,
    List<Description>? names,
    List<Description>? descriptions,
    bool? hidden,
    String? fieldType,
    bool? isArray,
    String? defaultValue,
    List<Validator>? validators,
    List<Item>? items,
    bool? multiple,
    List<String>? children,
    String? type,
    String? workflowFieldId,
  }) =>
      Section(
        id: id ?? this.id,
        name: name ?? this.name,
        searchable: searchable ?? this.searchable,
        names: names ?? this.names,
        descriptions: descriptions ?? this.descriptions,
        hidden: hidden ?? this.hidden,
        fieldType: fieldType ?? this.fieldType,
        isArray: isArray ?? this.isArray,
        defaultValue: defaultValue ?? this.defaultValue,
        validators: validators ?? this.validators,
        items: items ?? this.items,
        multiple: multiple ?? this.multiple,
        children: children ?? this.children,
        type: type ?? this.type,
        workflowFieldId: workflowFieldId ?? this.workflowFieldId,
      );

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
        searchable: json["searchable"],
        names: json["names"] == null
            ? []
            : List<Description>.from(
                json["names"]!.map((x) => Description.fromJson(x))),
        descriptions: json["descriptions"] == null
            ? []
            : List<Description>.from(
                json["descriptions"]!.map((x) => Description.fromJson(x))),
        hidden: json["hidden"],
        fieldType: json["fieldType"],
        isArray: json["isArray"],
        defaultValue: json["defaultValue"],
        validators: json["validators"] == null
            ? []
            : List<Validator>.from(
                json["validators"]!.map((x) => Validator.fromJson(x))),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        multiple: json["multiple"],
        children: json["children"] == null
            ? []
            : List<String>.from(json["children"]!.map((x) => x)),
        type: json["type"],
        workflowFieldId: json["workflowFieldId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "searchable": searchable,
        "names": names == null
            ? []
            : List<dynamic>.from(names!.map((x) => x.toJson())),
        "descriptions": descriptions == null
            ? []
            : List<dynamic>.from(descriptions!.map((x) => x.toJson())),
        "hidden": hidden,
        "fieldType": fieldType,
        "isArray": isArray,
        "defaultValue": defaultValue,
        "validators": validators == null
            ? []
            : List<dynamic>.from(validators!.map((x) => x.toJson())),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "multiple": multiple,
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
        "type": type,
        "workflowFieldId": workflowFieldId,
      };
}

class Item {
  Item({
    this.key,
    this.label,
  });

  final String? key;
  final String? label;

  Item copyWith({
    String? key,
    String? label,
  }) =>
      Item(
        key: key ?? this.key,
        label: label ?? this.label,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        key: json["key"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "label": label,
      };
}

class Validator {
  Validator({
    this.type,
    this.required,
    this.numOfDecimals,
    this.number,
    this.date,
    this.include,
    this.length,
    this.dateValue,
    this.dateValueType,
    this.regex,
    this.extensions,
  });

  final String? type;
  final bool? required;
  final int? numOfDecimals;
  final int? number;
  final DateTime? date;
  final bool? include;
  final int? length;
  final int? dateValue;
  final String? dateValueType;
  final String? regex;
  final List<String>? extensions;

  Validator copyWith({
    String? type,
    bool? required,
    int? numOfDecimals,
    int? number,
    DateTime? date,
    bool? include,
    int? length,
    int? dateValue,
    String? dateValueType,
    String? regex,
    List<String>? extensions,
  }) =>
      Validator(
        type: type ?? this.type,
        required: required ?? this.required,
        numOfDecimals: numOfDecimals ?? this.numOfDecimals,
        number: number ?? this.number,
        date: date ?? this.date,
        include: include ?? this.include,
        length: length ?? this.length,
        dateValue: dateValue ?? this.dateValue,
        dateValueType: dateValueType ?? this.dateValueType,
        regex: regex ?? this.regex,
        extensions: extensions ?? this.extensions,
      );

  factory Validator.fromJson(Map<String, dynamic> json) => Validator(
        type: json["type"],
        required: json["required"],
        numOfDecimals: json["numOfDecimals"],
        number: json["number"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        include: json["include"],
        length: json["length"],
        dateValue: json["dateValue"],
        dateValueType: json["dateValueType"],
        regex: json["regex"],
        extensions: json["extensions"] == null
            ? []
            : List<String>.from(json["extensions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "required": required,
        "numOfDecimals": numOfDecimals,
        "number": number,
        "date": date?.toIso8601String(),
        "include": include,
        "length": length,
        "dateValue": dateValue,
        "dateValueType": dateValueType,
        "regex": regex,
        "extensions": extensions == null
            ? []
            : List<dynamic>.from(extensions!.map((x) => x)),
      };
}

class Step {
  Step({
    this.groupIds,
  });

  final List<String>? groupIds;

  Step copyWith({
    List<String>? groupIds,
  }) =>
      Step(
        groupIds: groupIds ?? this.groupIds,
      );

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        groupIds: json["groupIds"] == null
            ? []
            : List<String>.from(json["groupIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "groupIds":
            groupIds == null ? [] : List<dynamic>.from(groupIds!.map((x) => x)),
      };
}
