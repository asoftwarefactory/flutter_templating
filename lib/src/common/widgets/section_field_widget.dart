import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/widgets/inputs/string_input_widget.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../models/template.dart';
import 'inputs/bool_switch_input_widget.dart';
import 'inputs/currency_input_widget.dart';
import 'inputs/date_time_input_widget.dart';
import 'inputs/decimal_input_widget.dart';
import 'inputs/file_input_widget.dart';
import 'inputs/files_input_widget.dart';
import 'inputs/int_input_widget.dart';

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
      if (formGroup.contains(section.id!) == false) {
        formGroup.addAll({section.id!: control});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (section.isArray == true && (section.items?.isEmpty ?? true)) {
      return buildSimpleArrayField();
    } else {
      return buildSimpleField();
    }
  }

  // es TextField
  Widget buildSimpleField() {
    switch (section.fieldType) {
      case FieldTypes.String:
        final control = FormControl<String>();
        _addFormControlToFormGroup(control);
        return StringInputWidget(
          control: control,
          section: section,
        );
      case FieldTypes.Integer:
        final control = FormControl<int>();
        _addFormControlToFormGroup(control);
        return IntInputWidget(
          control: control,
          section: section,
        );
      case FieldTypes.Decimal:
        final control = FormControl<double>();
        _addFormControlToFormGroup(control);
        return DecimalInputWidget(
          control: control,
          section: section,
        );
      case FieldTypes.Currency:
        final control = FormControl<double>();
        _addFormControlToFormGroup(control);
        return CurrencyInputWidget(
          control: control,
          section: section,
        );
      case FieldTypes.Boolean:
        final control = FormControl<bool>();
        _addFormControlToFormGroup(control);
        return BoolSwitchInputWidget(
          control: control,
          section: section,
        );

      // DATES -----------------------------------------------------
      case FieldTypes.DateUtc:
        final control = FormControl<DateTime>();
        _addFormControlToFormGroup(control);
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.DateNoUtc:
        final control = FormControl<DateTime>();
        _addFormControlToFormGroup(control);
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.DateTime:
        final control = FormControl<DateTime>();
        _addFormControlToFormGroup(control);
        return DateTimeInputWidget(control: control, section: section);
      case FieldTypes.Time:
        final control = FormControl<DateTime>();
        _addFormControlToFormGroup(control);
        return DateTimeInputWidget(control: control, section: section);
      // DATES ----------------------------------------------------- END

      case FieldTypes.File:
        final control = FormControl<PlatformFile>();
        _addFormControlToFormGroup(control);
        return FileInputWidget(
          control: control,
          section: section,
        );
      default:
        return const SizedBox();
    }
  }

  Widget buildSimpleArrayField() {
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
        final control = FormControl<MultiFile<String>>();
        _addFormControlToFormGroup(control);
        return FilesInputWidget(
          control: control,
          section: section,
        );
      default:
        return const SizedBox();
    }
  }
}
