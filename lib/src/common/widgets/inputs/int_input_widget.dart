import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';
import '../custom_main_text.dart';
import 'input_field.dart';

class IntInputWidget extends StatelessWidget implements InputField {
  const IntInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<int> control;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      readOnly: section.readonly ?? false,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^-?\d{0,5}')),
      ],
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
