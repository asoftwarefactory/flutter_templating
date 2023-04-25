import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';
import '../../utils/app_sizes.dart';

class DateTimeInputWidget extends StatelessWidget {
  const DateTimeInputWidget({
    Key? key,
    required this.control,
    required this.section,
  }) : super(key: key);
  final FormControl<DateTime> control;
  final Section section;
  @override
  Widget build(BuildContext context) {
    return ReactiveDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      builder: (context, picker, child) {
        return Row(
          children: [
            IgnorePointer(
              ignoring: section.readonly == true,
              child: IconButton(
                onPressed: picker.showPicker,
                icon: const Icon(Icons.date_range),
              ),
            ),
            gapW12,
            AutoSizeText(
                section.names?.getDescriptionLabelTranslated(context) ?? ''),
          ],
        );
      },
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      formControl: control,
      fieldLabelText:
          section.names?.getDescriptionLabelTranslated(context) ?? '',
    );
  }
}
