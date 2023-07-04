import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'unique_value.dart';

// fundamental section for the creation and typing of all the forms that the template will use
void initializeMainFormWithTtemplate(FormGroup mainForm, Template template) {
  for (final section in template.sections) {
    _initializeMainFormWithSection(mainForm, section);
  }
}

void _initializeMainFormWithSection(FormGroup mainForm, Section childSection) {
  if (childSection.type == SectionType.GROUP) {
    final control = _createControlWithSectionGroup(mainForm, childSection);
    mainForm.setAbstractControlAndValidator(
      childSection.id,
      () => control,
      isArray: childSection.isArray ?? false,
      validators: childSection.validators,
    );
  } else if (childSection.type == SectionType.FIELD) {
    final control = createControlWithSectionField(childSection);
    mainForm.setAbstractControlAndValidator(
      childSection.id,
      () => control,
      isArray: childSection.isArray ?? false,
      validators: childSection.validators,
    );
  }
}

AbstractControl<dynamic> _createControlWithSectionGroup(
    FormGroup parentForm, Section sectionIn) {
  if (sectionIn.isMultiple) {
    final formArray = FormArray([]);
    for (final section in sectionIn.children) {
      _initializeMainFormWithSection(parentForm, section);
    }
    return formArray;
  } else {
    final control = FormGroup({});
    for (final section in sectionIn.children) {
      _initializeMainFormWithSection(control, section);
    }
    return control;
  }
}

AbstractControl createControlWithSectionField(Section section) {
  dynamic defaultValueField() {
    dynamic value = section.defaultValue;
    return value;
  }

  final items = section.items ?? [];
  final isArray = section.isArray ?? false;
  final isAutocomplete = section.autocomplete != null &&
      (section.autocomplete?.name != null ||
          (section.autocomplete!.inputs ?? []).isNotEmpty);

  if (isAutocomplete) {
    return FormControl<Item>(touched: true, value: defaultValueField());
  } else if (items.isEmpty && !isArray) {
    switch (section.fieldType) {
      case FieldTypes.String:
        return FormControl<String>(value: defaultValueField(), touched: true);
      case FieldTypes.Integer:
        return FormControl<int>(value: defaultValueField(), touched: true);
      case FieldTypes.Decimal:
        return FormControl<double>(value: defaultValueField(), touched: true);
      case FieldTypes.Currency:
        return FormControl<double>(value: defaultValueField(), touched: true);
      case FieldTypes.Boolean:
        return FormControl<bool>(value: defaultValueField(), touched: true);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        return FormControl<DateTime>(value: defaultValueField(), touched: true);
      case FieldTypes.DateNoUtc:
        return FormControl<DateTime>(value: defaultValueField(), touched: true);
      case FieldTypes.DateTime:
        return FormControl<DateTime>(value: defaultValueField(), touched: true);
      case FieldTypes.Time:
        return FormControl<DateTime>(value: defaultValueField(), touched: true);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        return FormControl<PlatformFile>(
            value: defaultValueField(), touched: true);
      default:
        return FormControl();
    }
  } else if (items.isEmpty && isArray) {
    switch (section.fieldType) {
      case FieldTypes.String:
        return FormArray<String>(
            [FormControl<String>(value: defaultValueField(), touched: true)]);
      case FieldTypes.Integer:
        return FormArray<int>(
            [FormControl<int>(value: defaultValueField(), touched: true)]);
      case FieldTypes.Decimal:
        return FormArray<double>(
            [FormControl<double>(value: defaultValueField(), touched: true)]);
      case FieldTypes.Currency:
        return FormArray<double>(
            [FormControl<double>(value: defaultValueField(), touched: true)]);
      case FieldTypes.Boolean:
        return FormArray<bool>(
            [FormControl<bool>(value: defaultValueField(), touched: true)]);

      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        return FormArray<DateTime>(
            [FormControl<DateTime>(value: defaultValueField(), touched: true)]);
      case FieldTypes.DateNoUtc:
        return FormArray<DateTime>(
            [FormControl<DateTime>(value: defaultValueField(), touched: true)]);
      case FieldTypes.DateTime:
        return FormArray<DateTime>(
            [FormControl<DateTime>(value: defaultValueField(), touched: true)]);
      case FieldTypes.Time:
        return FormArray<DateTime>(
            [FormControl<DateTime>(value: defaultValueField(), touched: true)]);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        return FormControl<MultiFile<String>>(
            value: defaultValueField(), touched: true);
      default:
        return FormControl();
    }
  } else if (items.isNotEmpty && !isArray) {
    switch (section.fieldType) {
      case FieldTypes.String:
        return FormControl<String>(value: defaultValueField(), touched: true);
      case FieldTypes.Integer:
        return FormControl<int>(value: defaultValueField(), touched: true);
      case FieldTypes.Decimal:
        return FormControl<double>(value: defaultValueField(), touched: true);
      case FieldTypes.Currency:
        return FormControl<double>(value: defaultValueField(), touched: true);
      case FieldTypes.Boolean:
        return FormControl<Unique<bool>>(
            value: defaultValueField(), touched: true);

      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        return FormControl<String>(value: defaultValueField(), touched: true);
      case FieldTypes.DateNoUtc:
        return FormControl<String>(value: defaultValueField(), touched: true);
      case FieldTypes.DateTime:
        return FormControl<String>(value: defaultValueField(), touched: true);
      case FieldTypes.Time:
        return FormControl<String>(value: defaultValueField(), touched: true);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        return FormControl<String>(value: defaultValueField(), touched: true);
      default:
        return FormControl();
    }
  } else if (items.isNotEmpty && isArray) {
    switch (section.fieldType) {
      case FieldTypes.String:
        return FormControl<List<String>>(
            value: defaultValueField(), touched: true);
      case FieldTypes.Integer:
        return FormControl<List<int>>(
            value: defaultValueField(), touched: true);
      case FieldTypes.Decimal:
        return FormControl<List<double>>(
            value: defaultValueField(), touched: true);
      case FieldTypes.Currency:
        return FormControl<List<double>>(
            value: defaultValueField(), touched: true);
      case FieldTypes.Boolean:
        return FormControl<List<String>>(
            value: defaultValueField(), touched: true);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        return FormControl<List<String>>(
            value: defaultValueField(), touched: true);
      case FieldTypes.DateNoUtc:
        return FormControl<List<String>>(
            value: defaultValueField(), touched: true);
      case FieldTypes.DateTime:
        return FormControl<List<String>>(
            value: defaultValueField(), touched: true);
      case FieldTypes.Time:
        return FormControl<List<String>>(
            value: defaultValueField(), touched: true);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        return FormControl<List<String>>(
            value: defaultValueField(), touched: true);
      default:
        return FormControl();
    }
  } else {
    return FormControl();
  }
}
