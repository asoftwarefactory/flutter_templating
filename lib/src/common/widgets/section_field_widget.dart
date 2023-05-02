import 'package:flutter/material.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/widgets/inputs/string_input_widget.dart';
import '../models/template.dart';
import 'inputs/custom_dropdown_field.dart';
import 'inputs/bool_switch_input_widget.dart';
import 'inputs/currency_input_widget.dart';
import 'inputs/date_time_input_widget.dart';
import 'inputs/decimal_input_widget.dart';
import 'inputs/file_input_widget.dart';
import 'inputs/files_input_widget.dart';
import 'inputs/int_input_widget.dart';
import 'inputs/multiselect_chip_item_field.dart';

class SectionFieldWidget extends StatelessWidget {
  final Section section;
  final FormGroup formGroup;

  const SectionFieldWidget({
    super.key,
    required this.section,
    required this.formGroup,
  });

  void _addFormControlToFormGroup(FormControl control) {
    if (section.id == null) {
      throw Exception("section id null");
    } else {
      formGroup.addAll({section.id!: control});
    }
  }

  dynamic get _defaultValue {
    dynamic value = section.defaultValue;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final items = section.items ?? [];
    final isArray = section.isArray ?? false;
    if (items.isEmpty && !isArray) {
      return buildField();
    } else if (items.isEmpty && isArray) {
      return buildArrayField();
    } else if (items.isNotEmpty && !isArray) {
      return buildSelectField();
    } else if (items.isNotEmpty && isArray) {
      return buildMultipleSelectField();
    } else {
      return const SizedBox();
    }
  }

  // es TextField
  Widget buildField() {
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = FormControl<String>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return StringInputWidget(control: control, section: section);
      case FieldTypes.Integer:
        final control = FormControl<int>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return IntInputWidget(control: control, section: section);
      case FieldTypes.Decimal:
        final control = FormControl<double>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return DecimalInputWidget(control: control, section: section);
      case FieldTypes.Currency:
        final control = FormControl<double>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CurrencyInputWidget(control: control, section: section);
      case FieldTypes.Boolean:
        final control = FormControl<bool>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return BoolSwitchInputWidget(control: control, section: section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = FormControl<DateTime>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.DateNoUtc:
        final control = FormControl<DateTime>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.DateTime:
        final control = FormControl<DateTime>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.Time:
        final control = FormControl<DateTime>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return DateTimeInputWidget(control: control, section: section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = FormControl<PlatformFile>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return FileInputWidget(control: control, section: section);
      default:
        return const SizedBox();
    }
  }

  Widget buildArrayField() {
    switch (section.fieldType) {
      case FieldTypes.String:
      case FieldTypes.Integer:
      case FieldTypes.Decimal:
      case FieldTypes.Currency:
      case FieldTypes.Boolean:
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
      case FieldTypes.DateNoUtc:
      case FieldTypes.DateTime:
      case FieldTypes.Time:
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = FormControl<MultiFile<String>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return FilesInputWidget(control: control, section: section);
      default:
        return const SizedBox();
    }
  }

  Widget buildSelectField() {
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = FormControl<String>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Integer:
        final control = FormControl<int>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Decimal:
        final control = FormControl<double>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Currency:
        final control = FormControl<double>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Boolean:
        final control = FormControl<bool>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = FormControl<String>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.DateNoUtc:
        final control = FormControl<String>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.DateTime:
        final control = FormControl<String>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Time:
        final control = FormControl<String>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = FormControl<String>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return CustomDropdownField(control: control, section: section);
      default:
        return const SizedBox();
    }
  }

  Widget buildMultipleSelectField() {
    // selezione multipla
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = FormControl<List<String>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Integer:
        final control = FormControl<List<int>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Decimal:
        final control = FormControl<List<double>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Currency:
        final control = FormControl<List<double>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Boolean:
        final control = FormControl<List<bool>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = FormControl<List<String>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.DateNoUtc:
        final control = FormControl<List<String>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.DateTime:
        final control = FormControl<List<String>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Time:
        final control = FormControl<List<String>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = FormControl<List<String>>(value: _defaultValue);
        _addFormControlToFormGroup(control);
        return MultiSelectChipItemField(control: control, section: section);
      default:
        return const SizedBox();
    }
  }
}
