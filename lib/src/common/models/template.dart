// To parse this JSON data, do
//
//     final template = templateFromJson(jsonString);

// ignore_for_file: constant_identifier_names

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
    this.migrationType,
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
  final List<TemplateStep>? steps;
  final String? name;
  final TemplateMigrationTypes? migrationType;

  static String get pNameid => "id";
  static String get pNamegroupId => "groupId";
  static String get pNamecreatedAt => "createdAt";
  static String get pNameisValid => "isValid";
  static String get pNamescopes => "scopes";
  static String get pNamenames => "names";
  static String get pNamedescriptions => "descriptions";
  static String get pNamesections => "sections";
  static String get pNameenabledIfRules => "enabledIfRules";
  static String get pNamedataProviders => "dataProviders";
  static String get pNamesteps => "steps";
  static String get pNamename => "name";
  static String get pNamemigrationType => "migrationType";

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
    List<TemplateStep>? steps,
    String? name,
    TemplateMigrationTypes? migrationType,
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
        migrationType: migrationType ?? this.migrationType,
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
            : List<TemplateStep>.from(
                json["steps"]!.map((x) => TemplateStep.fromJson(x))),
        name: json["name"],
        migrationType: templateMigrationTypesValues.map[json["migrationType"]],
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
        "migrationType": templateMigrationTypesValues.reverse[migrationType],
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
  final DataProviderTypes? type;
  final String? dataProviderName;
  final List<Put>? inputs;
  final List<Put>? outputs;
  final String? sectionChildId;

  static String get pNameid => "id";
  static String get pNamename => "name";
  static String get pNametype => "type";
  static String get pNamedataProviderName => "dataProviderName";
  static String get pNameinputs => "inputs";
  static String get pNameoutputs => "outputs";
  static String get pNamesectionChildId => "sectionChildId";

  DataProvider copyWith({
    String? id,
    String? name,
    DataProviderTypes? type,
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
        type: dataProviderTypesValues.map[json["type"]],
        dataProviderName: json["dataProviderName"],
        inputs: json["outputs"] == null
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
        "type": dataProviderTypesValues.reverse[type],
        "dataProviderName": dataProviderName,
        "inputs":
            inputs == null ? [] : List<dynamic>.from(inputs!.map((x) => x)),
        "outputs": outputs == null
            ? []
            : List<dynamic>.from(outputs!.map((x) => x.toJson())),
        "sectionChildId": sectionChildId,
      };
}

enum DataProviderTypes {
  Simple,
  FillGroup,
  Items,
}

final dataProviderTypesValues = EnumValues({
  "Simple": DataProviderTypes.Simple,
  "FillGroup": DataProviderTypes.FillGroup,
  "Items": DataProviderTypes.Items
});

class Put {
  Put({
    this.fieldId,
    this.dataProviderFieldName,
  });

  final String? fieldId;
  final String? dataProviderFieldName;

  static String get pNamefieldId => "fieldId";
  static String get pNamedataProviderFieldName => "dataProviderFieldName";

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

  static String get pNameculture => "culture";
  static String get pNamelabel => "label";

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

  static String get pNameid => "id";
  static String get pNamename => "name";
  static String get pNameconditions => "conditions";
  static String get pNamegroupIds => "groupIds";
  static String get pNamefieldIds => "fieldIds";

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
  final EnabledIfConstraints? constraint;
  final List<dynamic>? values;

  static String get pNamefieldId => "fieldId";
  static String get pNameconstraint => "constraint";
  static String get pNamevalues => "values";

  Condition copyWith({
    String? fieldId,
    EnabledIfConstraints? constraint,
    List<dynamic>? values,
  }) =>
      Condition(
        fieldId: fieldId ?? this.fieldId,
        constraint: constraint ?? this.constraint,
        values: values ?? this.values,
      );

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        fieldId: json["fieldId"],
        constraint: enabledIfConstraintsValues.map[json["constraint"]],
        values: json["values"] == null
            ? []
            : List<dynamic>.from(json["values"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "fieldId": fieldId,
        "constraint": enabledIfConstraintsValues.reverse[constraint],
        "values":
            values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
      };
}

enum EnabledIfConstraints {
  Equal,
  ContainsOne,
  ContainsAll,
  GreaterThan,
  GreaterOrEqualThan,
  LessThan,
  LessOrEqualThan,
  NotEqual,
}

final enabledIfConstraintsValues = EnumValues<EnabledIfConstraints>({
  "Equal": EnabledIfConstraints.Equal,
  "ContainsOne": EnabledIfConstraints.ContainsOne,
  "ContainsAll": EnabledIfConstraints.ContainsAll,
  "GreaterThan": EnabledIfConstraints.GreaterThan,
  "GreaterOrEqualThan": EnabledIfConstraints.GreaterOrEqualThan,
  "LessThan": EnabledIfConstraints.LessThan,
  "LessOrEqualThan": EnabledIfConstraints.LessOrEqualThan,
  "NotEqual": EnabledIfConstraints.NotEqual,
});

class Section {
  Section({
    this.id,
    this.name,
    this.searchable,
    this.names,
    this.descriptions,
    this.hidden,
    this.readonly,
    this.fieldType,
    this.isArray,
    this.defaultValue,
    this.validators,
    this.items,
    this.multiple,
    this.children,
    this.type,
    this.workflowFieldId,
    this.autocomplete,
  });

  final String? id;
  final String? name;
  final bool? searchable;
  final List<Description>? names;
  final List<Description>? descriptions;
  final bool? hidden;
  final bool? readonly;
  final FieldTypes? fieldType;
  final bool? isArray;
  final dynamic defaultValue;
  final List<FieldValidator>? validators;
  final List<Item>? items;
  final bool? multiple;
  final List<Section>? children;
  final SectionType? type;
  final String? workflowFieldId;
  final TemplateFieldAutocomplete? autocomplete;

  static String get pNameid => "id";
  static String get pNamename => "name";
  static String get pNamesearchable => "searchable";
  static String get pNamenames => "names";
  static String get pNamedescriptions => "descriptions";
  static String get pNamehidden => "hidden";
  static String get pNamereadonly => "readonly";
  static String get pNamefieldType => "fieldType";
  static String get pNameisArray => "isArray";
  static String get pNamedefaultValue => "defaultValue";
  static String get pNamevalidators => "validators";
  static String get pNameitems => "items";
  static String get pNamemultiple => "multiple";
  static String get pNamechildren => "children";
  static String get pNametype => "type";
  static String get pNameworkflowFieldId => "workflowFieldId";
  static String get pNameautocomplete => "autocomplete";

  Section copyWith({
    String? id,
    String? name,
    bool? searchable,
    List<Description>? names,
    List<Description>? descriptions,
    bool? hidden,
    bool? readonly,
    FieldTypes? fieldType,
    bool? isArray,
    dynamic defaultValue,
    List<FieldValidator>? validators,
    List<Item>? items,
    bool? multiple,
    List<Section>? children,
    SectionType? type,
    String? workflowFieldId,
    TemplateFieldAutocomplete? autocomplete,
  }) =>
      Section(
        id: id ?? this.id,
        name: name ?? this.name,
        searchable: searchable ?? this.searchable,
        names: names ?? this.names,
        descriptions: descriptions ?? this.descriptions,
        hidden: hidden ?? this.hidden,
        readonly: readonly ?? this.readonly,
        fieldType: fieldType ?? this.fieldType,
        isArray: isArray ?? this.isArray,
        defaultValue: defaultValue ?? this.defaultValue,
        validators: validators ?? this.validators,
        items: items ?? this.items,
        multiple: multiple ?? this.multiple,
        children: children ?? this.children,
        type: type ?? this.type,
        workflowFieldId: workflowFieldId ?? this.workflowFieldId,
        autocomplete: autocomplete ?? this.autocomplete,
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
        readonly: json["readonly"],
        fieldType: fieldTypesValues.map[json["fieldType"]],
        isArray: json["isArray"],
        defaultValue: json["defaultValue"],
        validators: json["validators"] == null
            ? []
            : List<FieldValidator>.from(
                json["validators"]!.map((x) => FieldValidator.fromJson(x))),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        multiple: json["multiple"],
        children: json["children"] == null
            ? []
            : List<Section>.from(
                json["children"]!.map((x) => Section.fromJson(x))),
        type: sectionTypeValues.map[json["type"]],
        workflowFieldId: json["workflowFieldId"],
        autocomplete:
            TemplateFieldAutocomplete.fromJson(json["autocomplete"] ?? {}),
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
        "readonly": readonly,
        "fieldType": fieldTypesValues.reverse[fieldType],
        "isArray": isArray,
        "defaultValue": defaultValue,
        "validators": validators == null
            ? []
            : List<dynamic>.from(validators!.map((x) => x.toJson())),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "multiple": multiple,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "type": sectionTypeValues.reverse[type],
        "workflowFieldId": workflowFieldId,
        "autocomplete": autocomplete?.toJson(),
      };
}

enum FieldTypes {
  String,
  Integer,
  Decimal,
  Currency,
  Boolean,
  DateUtc,
  DateNoUtc,
  DateTime,
  Time,
  File,
}

final fieldTypesValues = EnumValues({
  "String": FieldTypes.String,
  "Integer": FieldTypes.Integer,
  "Decimal": FieldTypes.Decimal,
  "Currency": FieldTypes.Currency,
  "Boolean": FieldTypes.Boolean,
  "DateUtc": FieldTypes.DateUtc,
  "DateNoUtc": FieldTypes.DateNoUtc,
  "DateTime": FieldTypes.DateTime,
  "Time": FieldTypes.Time,
  "File": FieldTypes.File,
});

class TemplateFieldAutocomplete {
  final String? name;
  final List<TemplateAutocompleteFieldMapping>? inputs;
  TemplateFieldAutocomplete({
    this.name,
    this.inputs,
  });

  static String get pNamename => "name";
  static String get pNameinputs => "inputs";

  TemplateFieldAutocomplete copyWith({
    String? name,
    List<TemplateAutocompleteFieldMapping>? inputs,
  }) {
    return TemplateFieldAutocomplete(
      name: name ?? this.name,
      inputs: inputs ?? this.inputs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'inputs': inputs?.map((x) => x.toJson()).toList(),
    };
  }

  factory TemplateFieldAutocomplete.fromJson(Map<String, dynamic> map) {
    return TemplateFieldAutocomplete(
      name: map['name'],
      inputs: map['inputs'] != null
          ? List<TemplateAutocompleteFieldMapping>.from(map['inputs']
              ?.map((x) => TemplateAutocompleteFieldMapping.fromJson(x)))
          : null,
    );
  }
}

class TemplateAutocompleteFieldMapping {
  final String? fieldId;
  final String? autocompleteFieldName;
  TemplateAutocompleteFieldMapping({
    this.fieldId,
    this.autocompleteFieldName,
  });

  static String get pNamefieldId => "fieldId";
  static String get pNameautocompleteFieldName => "autocompleteFieldName";

  TemplateAutocompleteFieldMapping copyWith({
    String? fieldId,
    String? autocompleteFieldName,
  }) {
    return TemplateAutocompleteFieldMapping(
      fieldId: fieldId ?? this.fieldId,
      autocompleteFieldName:
          autocompleteFieldName ?? this.autocompleteFieldName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fieldId': fieldId,
      'autocompleteFieldName': autocompleteFieldName,
    };
  }

  factory TemplateAutocompleteFieldMapping.fromJson(Map<String, dynamic> map) {
    return TemplateAutocompleteFieldMapping(
      fieldId: map['fieldId'],
      autocompleteFieldName: map['autocompleteFieldName'],
    );
  }
}

class Item {
  Item({
    this.key,
    this.label,
  });

  final dynamic key;
  final String? label;

  static String get pNamekey => "key";
  static String get pNamelabel => "label";

  Item copyWith({
    dynamic key,
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

enum SectionType { GROUP, FIELD }

final sectionTypeValues =
    EnumValues({"Field": SectionType.FIELD, "Group": SectionType.GROUP});

class FieldValidator {
  FieldValidator({
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

  final FieldValidatorTypes? type;
  // Fatto
  final bool? required;
  final int? numOfDecimals;
  final int? number;
  final DateTime? date;
  final bool? include;
  final int? length;
  final int? dateValue;
  final DateValueTypes? dateValueType;
  // Fatto
  final String? regex;
  final List<String>? extensions;

  static String get pNametype => "type";
  static String get pNamerequired => "required";
  static String get pNamenumOfDecimals => "numOfDecimals";
  static String get pNamenumber => "number";
  static String get pNamedate => "date";
  static String get pNameinclude => "include";
  static String get pNamelength => "length";
  static String get pNamedateValue => "dateValue";
  static String get pNamedateValueType => "dateValueType";
  static String get pNameregex => "regex";
  static String get pNameextensions => "extensions";

  FieldValidator copyWith({
    FieldValidatorTypes? type,
    bool? required,
    int? numOfDecimals,
    int? number,
    DateTime? date,
    bool? include,
    int? length,
    int? dateValue,
    DateValueTypes? dateValueType,
    String? regex,
    List<String>? extensions,
  }) =>
      FieldValidator(
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

  factory FieldValidator.fromJson(Map<String, dynamic> json) => FieldValidator(
        type: fieldValidatorTypesValues.map[json["type"]],
        required: json["required"],
        numOfDecimals: json["numOfDecimals"],
        number: json["number"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        include: json["include"],
        length: json["length"],
        dateValue: json["dateValue"],
        dateValueType: dateValueTypesValues.map[json["dateValueType"]],
        regex: json["regex"],
        extensions: json["extensions"] == null
            ? []
            : List<String>.from(json["extensions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": fieldValidatorTypesValues.reverse[type],
        "required": required,
        "numOfDecimals": numOfDecimals,
        "number": number,
        "date": date?.toIso8601String(),
        "include": include,
        "length": length,
        "dateValue": dateValue,
        "dateValueType": dateValueTypesValues.reverse[dateValueType],
        "regex": regex,
        "extensions": extensions == null
            ? []
            : List<dynamic>.from(extensions!.map((x) => x)),
      };
}

enum DateValueTypes {
  Year,
  Month,
  Day,
}

final dateValueTypesValues = EnumValues<DateValueTypes>({
  "Year": DateValueTypes.Year,
  "Month": DateValueTypes.Month,
  "Day": DateValueTypes.Day,
});

enum FieldValidatorTypes {
  // Validatore di lunghezza minima
  MinimumLengthValidator,

  // Validatore di lunghezza massima
  MaximumLengthValidator,

  // Validatore Numero Minimo
  MinimumNumberValidator,

  // Validatore di numero massimo
  MaximumNumberValidator,

  // Convalida data minima Const
  MinimumConstDateValidator,

  // Convalida data massima cost
  MaximumConstDateValidator,

  // Validatore di data relativa minima
  MinimumRelativeDateValidator,

  // Validatore di data relativa massima
  MaximumRelativeDateValidator,

  // Validatore di elementi minimi
  MinimumItemsValidator,

  // Validatore di elementi massimi
  MaximumItemsValidator,

  // Validatore di numeri decimali
  DecimalNumbersValidator,

  // Fatto
  // Obbligatorio
  RequiredValidator,

  // Fatto
  // Validatore Regex
  RegexValidator,

  // Validatore di estensioni
  ExtensionsValidator
}

final fieldValidatorTypesValues = EnumValues({
  "MinimumLengthValidator": FieldValidatorTypes.MinimumLengthValidator,
  "MaximumLengthValidator": FieldValidatorTypes.MaximumLengthValidator,
  "MinimumNumberValidator": FieldValidatorTypes.MinimumNumberValidator,
  "MaximumNumberValidator": FieldValidatorTypes.MaximumNumberValidator,
  "MinimumConstDateValidator": FieldValidatorTypes.MinimumConstDateValidator,
  "MaximumConstDateValidator": FieldValidatorTypes.MaximumConstDateValidator,
  "MinimumRelativeDateValidator":
      FieldValidatorTypes.MinimumRelativeDateValidator,
  "MaximumRelativeDateValidator":
      FieldValidatorTypes.MaximumRelativeDateValidator,
  "MinimumItemsValidator": FieldValidatorTypes.MinimumItemsValidator,
  "MaximumItemsValidator": FieldValidatorTypes.MaximumItemsValidator,
  "DecimalNumbersValidator": FieldValidatorTypes.DecimalNumbersValidator,
  "RequiredValidator": FieldValidatorTypes.RequiredValidator,
  "RegexValidator": FieldValidatorTypes.RegexValidator,
  "ExtensionsValidator": FieldValidatorTypes.ExtensionsValidator,
});

class TemplateStep {
  TemplateStep({
    this.groupIds,
  });

  final List<String>? groupIds;

  static String get pNamegroupIds => "groupIds";

  TemplateStep copyWith({
    List<String>? groupIds,
  }) =>
      TemplateStep(
        groupIds: groupIds ?? this.groupIds,
      );

  factory TemplateStep.fromJson(Map<String, dynamic> json) => TemplateStep(
        groupIds: json["groupIds"] == null
            ? []
            : List<String>.from(json["groupIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "groupIds":
            groupIds == null ? [] : List<dynamic>.from(groupIds!.map((x) => x)),
      };
}

enum TemplateMigrationTypes { Disabled, Permissive, Restrictive }

final templateMigrationTypesValues = EnumValues({
  "Disabled": TemplateMigrationTypes.Disabled,
  "Permissive": TemplateMigrationTypes.Permissive,
  "Restrictive": TemplateMigrationTypes.Restrictive
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
