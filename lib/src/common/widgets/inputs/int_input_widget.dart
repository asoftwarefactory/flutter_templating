import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';

class IntInputWidget extends StatelessWidget {
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
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: AutoSizeText(
            section.names?.getDescriptionLabelTranslated(context) ?? ''),
        hintText: section.names?.getDescriptionLabelTranslated(context) ?? '',
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
