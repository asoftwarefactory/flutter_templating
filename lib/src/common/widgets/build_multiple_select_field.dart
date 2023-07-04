import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import '../../core/providers/providers.dart';
import '../mixins/enable_if_rule_mixin.dart';
import 'inputs/multiselect_dropdown_field.dart';

class BuildMultipleSelectField extends ConsumerWidget with EnableIfRuleMixin {
  final dynamic defaultValue;
  final Section section;
  final FormGroup form;
  final List<Item> items;
  const BuildMultipleSelectField({
    Key? key,
    required this.defaultValue,
    required this.section,
    required this.form,
    this.items = const [],
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final widget = _buildMultipleSelectField(
        context, form, items.isEmpty ? (section.items ?? []) : items);
    super.initializeField(form, ref.read(templateRenderInputProvider).template,
        fieldId: section.id);
    return widget;
  }

  Widget _buildMultipleSelectField(
      BuildContext ctx, FormGroup form, Items items) {
    final isArray = section.isArray ?? false;
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<String>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<String>>;
        return MultiSelectDropdownField(
          control: control,
          section: section,
          items: items,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as String == v)?.label ?? "",
        );
      case FieldTypes.Integer:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<int>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<int>>;
        return MultiSelectDropdownField(
          control: control,
          section: section,
          items: items,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as int == v)?.label ?? "",
        );
      case FieldTypes.Decimal:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<double>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<double>>;
        return MultiSelectDropdownField(
          control: control,
          section: section,
          items: items,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as double == v)?.label ?? "",
        );
      case FieldTypes.Currency:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<double>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<double>>;
        return MultiSelectDropdownField<double>(
          control: control,
          items: items,
          section: section,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as double == v)?.label ?? "",
        );
      case FieldTypes.Boolean:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<String>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<String>>;
        final mappedItems = (section.items ?? [])
            .asMap()
            .map(
                (k, v) => MapEntry(k, Item(key: "${v.key}_$k", label: v.label)))
            .values
            .toList();
        final sec = section.copyWith(items: mappedItems);
        return MultiSelectDropdownField<String>(
          control: control,
          section: sec,
          items: items,
          label: (v, items) =>
              items.firstWhere((i) => v == i.key.toString()).label ?? '',
        );
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<String>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<String>>;
        return MultiSelectDropdownField(
          control: control,
          section: section,
          items: items,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as String == v)?.label ?? "",
        );
      case FieldTypes.DateNoUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<String>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<String>>;
        return MultiSelectDropdownField(
          control: control,
          section: section,
          items: items,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as String == v)?.label ?? "",
        );
      case FieldTypes.DateTime:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<String>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<String>>;
        return MultiSelectDropdownField(
          control: control,
          section: section,
          items: items,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as String == v)?.label ?? "",
        );
      case FieldTypes.Time:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<String>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<String>>;
        return MultiSelectDropdownField(
          control: control,
          items: items,
          section: section,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as String == v)?.label ?? "",
        );
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = form.getOrSetAbstractControlAndSetValidators(section.id,
            () => FormControl<List<String>>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<List<String>>;
        return MultiSelectDropdownField(
          control: control,
          items: items,
          section: section,
          label: (v, items) =>
              items.firstWhereOrNull((e) => e.key as String == v)?.label ?? "",
        );
      default:
        return const SizedBox();
    }
  }
}
