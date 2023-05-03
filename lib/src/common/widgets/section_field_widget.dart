import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'build_array_field.dart';
import 'build_field.dart';
import 'build_multiple_select_field.dart';
import 'build_select_field.dart';
import 'inputs/validators/manager.dart';

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
  dynamic get _defaultValue {
    dynamic value = widget.section.defaultValue;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.section.id == null) {
      return const SizedBox();
    }
    return ReactiveFormConfig(
      validationMessages: ValidatorsManager.defaultValidationMessages,
      child: _initializeField(context),
    );
  }

  Widget _initializeField(BuildContext context) {
    final items = widget.section.items ?? [];
    final isArray = widget.section.isArray ?? false;

    if (items.isEmpty && !isArray) {
      return BuildField(
        defaultValue: _defaultValue,
        section: widget.section,
      );
    } else if (items.isEmpty && isArray) {
      return BuildArrayField(
        defaultValue: _defaultValue,
        section: widget.section,
      );
    } else if (items.isNotEmpty && !isArray) {
      return BuildSelectField(
        defaultValue: _defaultValue,
        section: widget.section,
      );
    } else if (items.isNotEmpty && isArray) {
      return BuildMultipleSelectField(
        defaultValue: _defaultValue,
        section: widget.section,
      );
    } else {
      return const SizedBox();
    }
  }

  /* Widget buildField() {
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue, touched: true),
        ) as FormControl<String>;
        return StringInputWidget(control: control, section: widget.section);
      case FieldTypes.Integer:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<int>(value: _defaultValue, touched: true),
        ) as FormControl<int>;
        return IntInputWidget(control: control, section: widget.section);
      case FieldTypes.Decimal:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<double>(value: _defaultValue, touched: true),
        ) as FormControl<double>;
        return DecimalInputWidget(control: control, section: widget.section);
      case FieldTypes.Currency:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<double>(value: _defaultValue, touched: true),
        ) as FormControl<double>;
        return CurrencyInputWidget(control: control, section: widget.section);
      case FieldTypes.Boolean:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<bool>(value: _defaultValue, touched: true),
        ) as FormControl<bool>;
        return BoolSwitchInputWidget(control: control, section: widget.section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<DateTime>(value: _defaultValue, touched: true),
        ) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: widget.section);
      case FieldTypes.DateNoUtc:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<DateTime>(value: _defaultValue, touched: true),
        ) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: widget.section);
      case FieldTypes.DateTime:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<DateTime>(value: _defaultValue, touched: true),
        ) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: widget.section);
      case FieldTypes.Time:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<DateTime>(value: _defaultValue, touched: true),
        ) as FormControl<DateTime>;
        return DateTimeInputWidget(control: control, section: widget.section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<PlatformFile>(value: _defaultValue, touched: true),
        ) as FormControl<PlatformFile>;
        return FileInputWidget(control: control, section: widget.section);
      default:
        return const SizedBox();
    }
  } */

  /* Widget buildArrayField(BuildContext context) {
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<String>(
              [FormControl<String>(value: _defaultValue, touched: true)]),
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
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<int>(
              [FormControl<int>(value: _defaultValue, touched: true)]),
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
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<double>(
              [FormControl<double>(value: _defaultValue, touched: true)]),
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
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<double>(
              [FormControl<double>(value: _defaultValue, touched: true)]),
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
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<bool>(
              [FormControl<bool>(value: _defaultValue, touched: true)]),
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
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<DateTime>(
              [FormControl<DateTime>(value: _defaultValue, touched: true)]),
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
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<DateTime>(
              [FormControl<DateTime>(value: _defaultValue, touched: true)]),
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
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<DateTime>(
              [FormControl<DateTime>(value: _defaultValue, touched: true)]),
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
        final formArray = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormArray<DateTime>(
              [FormControl<DateTime>(value: _defaultValue, touched: true)]),
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
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<MultiFile<String>>(
              value: _defaultValue, touched: true),
        ) as FormControl<MultiFile<String>>;
        return FilesInputWidget(control: control, section: widget.section);
      default:
        return const SizedBox();
    }
  } */

  /*  Widget buildSelectField() {
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue, touched: true),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Integer:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<int>(value: _defaultValue, touched: true),
        ) as FormControl<int>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Decimal:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<double>(value: _defaultValue, touched: true),
        ) as FormControl<double>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Currency:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<double>(value: _defaultValue, touched: true),
        ) as FormControl<double>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Boolean:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<bool>(value: _defaultValue, touched: true),
        ) as FormControl<bool>;
        return CustomDropdownField(control: control, section: widget.section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue, touched: true),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.DateNoUtc:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue, touched: true),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.DateTime:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue, touched: true),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      case FieldTypes.Time:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue, touched: true),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<String>(value: _defaultValue, touched: true),
        ) as FormControl<String>;
        return CustomDropdownField(control: control, section: widget.section);
      default:
        return const SizedBox();
    }
  } */

  /* Widget buildMultipleSelectField() {
    // selezione multipla
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue, touched: true),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Integer:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<int>>(value: _defaultValue, touched: true),
        ) as FormControl<List<int>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Decimal:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<double>>(value: _defaultValue, touched: true),
        ) as FormControl<List<double>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Currency:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<double>>(value: _defaultValue, touched: true),
        ) as FormControl<List<double>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Boolean:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<bool>>(value: _defaultValue, touched: true),
        ) as FormControl<List<bool>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue, touched: true),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.DateNoUtc:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue, touched: true),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.DateTime:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue, touched: true),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      case FieldTypes.Time:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue, touched: true),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      // DATES ----------------------------------------------------- END
      case FieldTypes.File:
        final control = _getOrSetAbstractControl(
          widget.section.id!,
          () => FormControl<List<String>>(value: _defaultValue, touched: true),
        ) as FormControl<List<String>>;
        return MultiSelectChipItemField(
            control: control, section: widget.section);
      default:
        return const SizedBox();
    }
  } */
}
