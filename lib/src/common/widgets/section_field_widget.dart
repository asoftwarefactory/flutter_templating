import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/widgets/inputs/string_input_widget.dart';
import '../models/template.dart';
import 'array_field.dart';
import 'core_template_render_widget.dart';
import 'inputs/custom_dropdown_field.dart';
import 'inputs/bool_switch_input_widget.dart';
import 'inputs/currency_input_widget.dart';
import 'inputs/date_time_input_widget.dart';
import 'inputs/decimal_input_widget.dart';
import 'inputs/file_input_widget.dart';
import 'inputs/files_input_widget.dart';
import 'inputs/int_input_widget.dart';
import 'inputs/multiselect_chip_item_field.dart';

class SectionFieldWidget extends ConsumerStatefulWidget {
  final Section section;

  const SectionFieldWidget({
    super.key,
    required this.section,
  });

  @override
  createState() => _SectionFieldWidgetState();
}

class _SectionFieldWidgetState extends ConsumerState<SectionFieldWidget> {
  AbstractControl<T> getOrSetAbstractControl<T>(
      String controlId, AbstractControl<T> Function() ifNotExistControl) {
    final form = ref.read(mainFormGroupProvider);
    if (form.controls.containsKey(controlId)) {
      return form.control(controlId) as AbstractControl<T>;
    } else {
      final control = ifNotExistControl();
      form.addAll({widget.section.id!: control});
      return control;
    }
  }

  dynamic get _defaultValue {
    dynamic value = widget.section.defaultValue;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.section.id == null) {
      return const SizedBox();
    }
    final items = widget.section.items ?? [];
    final isArray = widget.section.isArray ?? false;
    if (items.isEmpty && !isArray) {
      return buildField();
    } else if (items.isEmpty && isArray) {
      return buildArrayField(context);
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
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue),
        ) as FormControl<String>;
        return StringInputWidget(control: control, section: widget.section);
      case FieldTypes.Integer:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<int>(value: _defaultValue),
        ) as FormControl<int>;
        return IntInputWidget(control: control, section: widget.section);
      case FieldTypes.Decimal:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<double>(value: _defaultValue),
        ) as FormControl<double>;
        return DecimalInputWidget(control: control, section: widget.section);
      case FieldTypes.Currency:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<double>(value: _defaultValue),
        ) as FormControl<double>;
        return CurrencyInputWidget(control: control, section: widget.section);
      case FieldTypes.Boolean:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<bool>(value: _defaultValue),
        ) as FormControl<bool>;
        return BoolSwitchInputWidget(control: control, section: widget.section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<DateTime>(value: _defaultValue),
        ) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: widget.section);
      case FieldTypes.DateNoUtc:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<DateTime>(value: _defaultValue),
        ) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: widget.section);
      case FieldTypes.DateTime:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<DateTime>(value: _defaultValue),
        ) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: widget.section);
      case FieldTypes.Time:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<DateTime>(value: _defaultValue),
        ) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: widget.section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<PlatformFile>(value: _defaultValue),
        ) as FormControl<PlatformFile>;
        return FileInputWidget(control: control, section: widget.section);
      default:
        return const SizedBox();
    }
  }

  Widget buildArrayField(BuildContext context) {
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<String>([FormControl<String>(value: _defaultValue)]),
        ) as FormArray<String>;
        return ArrayField<String>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions
              ?.getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => StringInputWidget(
              control: control as FormControl<String>, section: widget.section),
        );
      case FieldTypes.Integer:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<int>([FormControl<int>(value: _defaultValue)]),
        ) as FormArray<int>;
        return ArrayField<int>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions!
              .getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => IntInputWidget(
              control: control as FormControl<int>, section: widget.section),
        );
      case FieldTypes.Decimal:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<double>([FormControl<double>(value: _defaultValue)]),
        ) as FormArray<double>;
        return ArrayField<double>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions!
              .getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DecimalInputWidget(
              control: control as FormControl<double>, section: widget.section),
        );
      case FieldTypes.Currency:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<double>([FormControl<double>(value: _defaultValue)]),
        ) as FormArray<double>;
        return ArrayField<double>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions!
              .getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DecimalInputWidget(
              control: control as FormControl<double>, section: widget.section),
        );
      case FieldTypes.Boolean:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<bool>([FormControl<bool>(value: _defaultValue)]),
        ) as FormArray<bool>;
        return ArrayField<bool>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions!
              .getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => BoolSwitchInputWidget(
              control: control as FormControl<bool>, section: widget.section),
        );
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<DateTime>(
              [FormControl<DateTime>(value: _defaultValue)]),
        ) as FormArray<DateTime>;
        return ArrayField<DateTime>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions!
              .getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DateTimeInputWidget(
              showClearIcon: false,
              control: control as FormControl<DateTime>,
              section: widget.section),
        );
      case FieldTypes.DateNoUtc:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<DateTime>(
              [FormControl<DateTime>(value: _defaultValue)]),
        ) as FormArray<DateTime>;
        return ArrayField<DateTime>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions!
              .getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DateTimeInputWidget(
              showClearIcon: false,
              control: control as FormControl<DateTime>,
              section: widget.section),
        );
      case FieldTypes.DateTime:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<DateTime>(
              [FormControl<DateTime>(value: _defaultValue)]),
        ) as FormArray<DateTime>;
        return ArrayField<DateTime>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions!
              .getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DateTimeInputWidget(
              showClearIcon: false,
              control: control as FormControl<DateTime>,
              section: widget.section),
        );
      case FieldTypes.Time:
        final formArray = getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<DateTime>(
              [FormControl<DateTime>(value: _defaultValue)]),
        ) as FormArray<DateTime>;
        return ArrayField<DateTime>(
          title:
              "Array - ${widget.section.names?.getDescriptionLabelTranslated(context)}",
          description: widget.section.descriptions!
              .getDescriptionLabelTranslated(context),
          formArray: formArray,
          fieldBuilder: (control, index) => DateTimeInputWidget(
              showClearIcon: false,
              control: control as FormControl<DateTime>,
              section: widget.section),
        );
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<MultiFile<String>>(value: _defaultValue),
        ) as FormControl<MultiFile<String>>;
        return FilesInputWidget(control: control, section: widget.section);
      default:
        return const SizedBox();
    }
  }

  Widget buildSelectField() {
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Integer:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<int>(value: _defaultValue),
        ) as FormControl<int>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Decimal:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<double>(value: _defaultValue),
        ) as FormControl<double>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Currency:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<double>(value: _defaultValue),
        ) as FormControl<double>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Boolean:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<bool>(value: _defaultValue),
        ) as FormControl<bool>;
        return CustomDropdownField(control: control, section: widget.section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.DateNoUtc:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.DateTime:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Time:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      default:
        return const SizedBox();
    }
  }

  Widget buildMultipleSelectField() {
    // selezione multipla
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Integer:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<int>>(value: _defaultValue),
        ) as FormControl<List<int>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Decimal:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<double>>(value: _defaultValue),
        ) as FormControl<List<double>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Currency:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<double>>(value: _defaultValue),
        ) as FormControl<List<double>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Boolean:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<bool>>(value: _defaultValue),
        ) as FormControl<List<bool>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.DateNoUtc:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.DateTime:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Time:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      default:
        return const SizedBox();
    }
  }
}
