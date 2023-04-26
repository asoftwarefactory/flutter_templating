import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';

class DateTimeInputWidget extends StatefulWidget {
  const DateTimeInputWidget({
    Key? key,
    required this.control,
    required this.section,
  }) : super(key: key);
  final FormControl<DateTime> control;
  final Section section;

  @override
  State<DateTimeInputWidget> createState() => _DateTimeInputWidgetState();
}

class _DateTimeInputWidgetState extends State<DateTimeInputWidget> {
  ReactiveDatePickerFieldType get _getDatePickerType {
    switch (widget.section.fieldType) {
      case FieldTypes.DateNoUtc:
        return ReactiveDatePickerFieldType.date;
      case FieldTypes.DateTime:
        return ReactiveDatePickerFieldType.dateTime;
      case FieldTypes.DateUtc:
        return ReactiveDatePickerFieldType.date;
      case FieldTypes.Time:
        return ReactiveDatePickerFieldType.time;
      default:
        return ReactiveDatePickerFieldType.dateTime;
    }
  }

  StreamSubscription<DateTime?>? _subscription;

  @override
  void initState() {
    // Manage to Date Utc Format
    _subscription = widget.control.valueChanges.listen((e) {
      if (e != null &&
          widget.section.fieldType == FieldTypes.DateUtc &&
          e.isUtc == false) {
        widget.control.value = e.toUtc();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveDateTimePicker(
      formControl: widget.control,
      type: _getDatePickerType,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.section.names?.getDescriptionLabelTranslated(context),
        border: const OutlineInputBorder(),
        helperText: '',
        suffixIcon: const Icon(Icons.calendar_today),
      ),
    );
  }
}
