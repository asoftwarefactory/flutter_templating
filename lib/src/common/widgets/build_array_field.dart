import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import '../mixins/enable_if_rule_mixin.dart';
import 'inputs/array_field.dart';
import 'inputs/bool_switch_input_widget.dart';
import 'inputs/date_time_input_widget.dart';
import 'inputs/decimal_input_widget.dart';
import 'inputs/files_input_widget.dart';
import 'inputs/int_input_widget.dart';
import 'inputs/string_input_widget.dart';

class BuildArrayField extends ConsumerWidget with EnableIfRuleMixin {
  final dynamic defaultValue;
  final Section section;
  final FormGroup form;
  const BuildArrayField({
    Key? key,
    required this.defaultValue,
    required this.section,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final field = buildArrayField(context, form);
    super.initializeField(form, ref.read(templateRenderInputProvider).template,
        fieldId: section.id);
    return field;
  }

  Widget buildArrayField(BuildContext context, FormGroup form) {
    final isArray = section.isArray ?? false;
    switch (section.fieldType) {
      case FieldTypes.String:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<String>(
                [FormControl<String>(value: defaultValue, touched: true)]),
            validators: section.validators,
            isArray: isArray) as FormArray<String>;
        return ArrayField<String>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions?.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => StringInputWidget(
              control: control as FormControl<String>, section: section),
        );
      case FieldTypes.Integer:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<int>(
                  [FormControl<int>(value: defaultValue, touched: true)],
                ),
            validators: section.validators,
            isArray: isArray) as FormArray<int>;
        return ArrayField<int>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions!.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => IntInputWidget(
              control: control as FormControl<int>, section: section),
        );
      case FieldTypes.Decimal:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<double>(
                [FormControl<double>(value: defaultValue, touched: true)]),
            validators: section.validators,
            isArray: isArray) as FormArray<double>;
        return ArrayField<double>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions!.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DecimalInputWidget(
              control: control as FormControl<double>, section: section),
        );
      case FieldTypes.Currency:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<double>(
                [FormControl<double>(value: defaultValue, touched: true)]),
            validators: section.validators,
            isArray: isArray) as FormArray<double>;
        return ArrayField<double>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions!.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DecimalInputWidget(
              control: control as FormControl<double>, section: section),
        );
      case FieldTypes.Boolean:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<bool>(
                [FormControl<bool>(value: defaultValue, touched: true)]),
            validators: section.validators,
            isArray: isArray) as FormArray<bool>;
        return ArrayField<bool>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions!.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => BoolSwitchInputWidget(
              control: control as FormControl<bool>, section: section),
        );
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<DateTime>(
                [FormControl<DateTime>(value: defaultValue, touched: true)]),
            validators: section.validators,
            isArray: isArray) as FormArray<DateTime>;
        return ArrayField<DateTime>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions!.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DateTimeInputWidget(
              showClearIcon: false,
              control: control as FormControl<DateTime>,
              section: section),
        );
      case FieldTypes.DateNoUtc:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<DateTime>(
                [FormControl<DateTime>(value: defaultValue, touched: true)]),
            validators: section.validators,
            isArray: isArray) as FormArray<DateTime>;
        return ArrayField<DateTime>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions!.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DateTimeInputWidget(
              showClearIcon: false,
              control: control as FormControl<DateTime>,
              section: section),
        );
      case FieldTypes.DateTime:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<DateTime>(
                [FormControl<DateTime>(value: defaultValue, touched: true)]),
            validators: section.validators,
            isArray: isArray) as FormArray<DateTime>;
        return ArrayField<DateTime>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions!.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DateTimeInputWidget(
              showClearIcon: false,
              control: control as FormControl<DateTime>,
              section: section),
        );
      case FieldTypes.Time:
        final formArray = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormArray<DateTime>(
                [FormControl<DateTime>(value: defaultValue, touched: true)]),
            validators: section.validators,
            isArray: isArray) as FormArray<DateTime>;
        return ArrayField<DateTime>(
          title:
              "Array - ${section.names?.getDescriptionLabelTranslated(context)}",
          description:
              section.descriptions!.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DateTimeInputWidget(
              showClearIcon: false,
              control: control as FormControl<DateTime>,
              section: section),
        );
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = form.getOrSetAbstractControlAndSetValidators(
            section.id!,
            () => FormControl<MultiFile<String>>(
                value: defaultValue, touched: true),
            validators: section.validators,
            isArray: isArray) as FormControl<MultiFile<String>>;
        return FilesInputWidget(control: control, section: section);
      default:
        return const SizedBox();
    }
  }
}
