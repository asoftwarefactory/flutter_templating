import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'inputs/custom_dropdown_field.dart';

class BuildSelectField extends ConsumerWidget {
  final dynamic defaultValue;
  final Section section;
  const BuildSelectField({
    Key? key,
    required this.defaultValue,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final form = ref.read(mainFormGroupProvider);
    return _buildSelectField(form);
  }

  Widget _buildSelectField(FormGroup form) {
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<String>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Integer:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<int>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<int>;
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Decimal:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<double>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<double>;
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Currency:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<double>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<double>;
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Boolean:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<bool>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<bool>;
        return CustomDropdownField(control: control, section: section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<String>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.DateNoUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<String>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.DateTime:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<String>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: section);
      case FieldTypes.Time:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<String>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = form.getOrSetAbstractControlAndSetValidators(
          section.id!,
          () => FormControl<String>(value: defaultValue, touched: true),
          validators: section.validators,
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: section);
      default:
        return const SizedBox();
    }
  }
}
