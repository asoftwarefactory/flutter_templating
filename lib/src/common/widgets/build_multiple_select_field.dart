import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'inputs/custom_dropdown_multiple_field.dart';
import 'inputs/multiselect_chip_item_field.dart';

class BuildMultipleSelectField extends ConsumerWidget {
  final dynamic defaultValue;
  final Section section;
  const BuildMultipleSelectField({
    Key? key,
    required this.defaultValue,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final form = ref.read(mainFormGroupProvider);
    return _buildMultipleSelectField(form);
  }

  Widget _buildMultipleSelectField(FormGroup form) {
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<String>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Integer:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<int>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<int>>;
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Decimal:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<double>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<double>>;
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Currency:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<double>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<double>>;
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Boolean:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<bool>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<bool>>;
        return ReactiveDropdownMultipleField(control: control, section: section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<String>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.DateNoUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<String>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.DateTime:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<String>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(control: control, section: section);
      case FieldTypes.Time:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<String>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(control: control, section: section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<List<String>>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(control: control, section: section);
      default:
        return const SizedBox();
    }
  }
}
