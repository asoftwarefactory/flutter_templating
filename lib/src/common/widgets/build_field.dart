import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import '../../core/providers/providers.dart';
import '../mixins/enable_if_rule_mixin.dart';
import 'inputs/bool_switch_input_widget.dart';
import 'inputs/currency_input_widget.dart';
import 'inputs/date_time_input_widget.dart';
import 'inputs/decimal_input_widget.dart';
import 'inputs/file_input_widget.dart';
import 'inputs/int_input_widget.dart';
import 'inputs/string_input_widget.dart';

class BuildField extends ConsumerWidget with EnableIfRuleMixin {
  final dynamic defaultValue;
  final Section section;
  final FormGroup form;
  const BuildField({
    Key? key,
    required this.defaultValue,
    required this.section,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final field = _buildField(form);
    super.initializeField(form, ref.read(templateRenderInputProvider).template,
        fieldId: section.id);
    return field;
  }

  Widget _buildField(FormGroup form) {
    final isArray = section.isArray ?? false;
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<String>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<String>;
        return StringInputWidget(control: control, section: section);
      case FieldTypes.Integer:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<int>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<int>;
        return IntInputWidget(control: control, section: section);
      case FieldTypes.Decimal:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<double>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<double>;
        return DecimalInputWidget(control: control, section: section);
      case FieldTypes.Currency:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<double>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<double>;
        return CurrencyInputWidget(control: control, section: section);
      case FieldTypes.Boolean:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<bool>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<bool>;
        return BoolSwitchInputWidget(control: control, section: section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<DateTime>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.DateNoUtc:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<DateTime>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.DateTime:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<DateTime>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.Time:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<DateTime>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id,
            () => FormControl<PlatformFile>(value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<PlatformFile>;
        return FileInputWidget(control: control, section: section);
      default:
        return const SizedBox();
    }
  }
}
