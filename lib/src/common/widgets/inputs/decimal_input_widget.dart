import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';

class DecimalInputWidget extends StatelessWidget {
  const DecimalInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<double> control;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      readOnly: section.readonly ?? false,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
        TextInputFormatter.withFunction((oldValue, newValue) {
          try {
            final text = newValue.text;
            if (text.isNotEmpty) double.parse(text);
            return newValue;
            // ignore: empty_catches
          } catch (e) {}
          return oldValue;
        }),
      ],
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
