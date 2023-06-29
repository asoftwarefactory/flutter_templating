import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import '../../core/providers/providers.dart';
import '../mixins/enable_if_rule_mixin.dart';
import '../utils/unique_value.dart';
import 'inputs/dropdown_field.dart';

class BuildSelectField extends ConsumerWidget with EnableIfRuleMixin {
  final dynamic defaultValue;
  final Section section;
  final FormGroup form;
  const BuildSelectField({
    Key? key,
    required this.defaultValue,
    required this.section,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final pr = ref.watch(itemsStateProvider);
    final items = pr[section.id] ?? [];
    final widget =
        _buildSelectField(form, items.isEmpty ? (section.items ?? []) : items);
    super.initializeField(form, ref.read(templateRenderInputProvider).template,
        fieldId: section.id);
    return widget;
  }

  Widget _buildSelectField(FormGroup form, Items items) {
    final isArray = section.isArray ?? false;

    switch (section.fieldType) {
      case FieldTypes.String:
        final control = form.getOrSetAbstractControlAndSetValidators<String>(
            section.id,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
            
        return DropdownField<String>(
            control: control, section: section, items: items);
      case FieldTypes.Integer:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<int>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<int>;
        return DropdownField(control: control, section: section, items: items);
      case FieldTypes.Decimal:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<double>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<double>;
        return DropdownField(control: control, section: section, items: items);
      case FieldTypes.Currency:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<double>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<double>;
        return DropdownField(control: control, section: section, items: items);
      case FieldTypes.Boolean:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<Unique<bool>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<Unique<bool>>;
        return DropdownField(
            control: control,
            section: section,
            valueFromSectionItem: (item) => Unique(value: item.key as bool),
            items: items);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section, items: items);
      case FieldTypes.DateNoUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section, items: items);
      case FieldTypes.DateTime:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section, items: items);
      case FieldTypes.Time:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section, items: items);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return DropdownField(control: control, section: section, items: items);
      default:
        return const SizedBox();
    }
  }
}
