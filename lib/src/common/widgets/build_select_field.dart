import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import '../mixins/enable_if_rule_mixin.dart';
import '../utils/unique_value.dart';
import 'inputs/dropdown_field.dart';

class BuildSelectField extends ConsumerWidget with EnableIfRuleMixin {
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
    final field = _buildSelectField(form);
    super.initialize(ref, fieldId: section.id);
    return field;
  }

  Widget _buildSelectField(FormGroup form) {
    final isArray = section.isArray ?? false;
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section);
      case FieldTypes.Integer:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<int>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<int>;
        return DropdownField(control: control, section: section);
      case FieldTypes.Decimal:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<double>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<double>;
        return DropdownField(control: control, section: section);
      case FieldTypes.Currency:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<double>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<double>;
        return DropdownField(control: control, section: section);
      case FieldTypes.Boolean:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<Unique<bool>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<Unique<bool>>;
        return DropdownField(
          control: control,
          section: section,
          valueFromSectionItem: (item) => Unique(value: item.key as bool),
        );
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section);
      case FieldTypes.DateNoUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section);
      case FieldTypes.DateTime:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section);
      case FieldTypes.Time:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section);
      default:
        return const SizedBox();
    }
  }
}
