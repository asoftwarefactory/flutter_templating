import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';
import '../custom_main_text.dart';
import 'input_field.dart';

class StringInputWidget extends StatelessWidget implements InputField {
  const StringInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<String> control;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      readOnly: section.readonly ?? false,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: CustomMainText(
          section.names?.getDescriptionLabelTranslated(context),
          expandIntoColumnOnRow: false,
        ),
        hintText: section.names?.getDescriptionLabelTranslated(context),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
      formControl: control,
    );
  }
}
