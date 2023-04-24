import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import '../models/template.dart';

class SectionFieldWidget extends StatefulWidget {
  final Section section;
  final FormGroup formGroup;
  const SectionFieldWidget({
    Key? key,
    required this.section,
    required this.formGroup,
  }) : super(key: key);

  @override
  State<SectionFieldWidget> createState() => _SectionFieldWidgetState();
}

class _SectionFieldWidgetState extends State<SectionFieldWidget> {
  final FormControl _control = FormControl();
  @override
  void initState() {
    if (widget.section.id == null) {
      throw Exception("section id null");
    } else {
      widget.formGroup.addAll({widget.section.id!: _control});
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.section.isArray == true) {
      return buildMultipleChild();
    } else {
      return buildSimpleChild();
    }
  }

  // es TextField
  Widget buildSimpleChild() {
    switch (widget.section.fieldType) {
      case FieldTypes.String:
        return ReactiveTextField(
          readOnly: widget.section.readonly ?? false,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
                widget.section.names?.getDescriptionLabelTranslated(context) ??
                    ''),
            hintText:
                widget.section.names?.getDescriptionLabelTranslated(context) ??
                    '',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          formControl: _control,
        );
      case FieldTypes.Integer:
        return ReactiveTextField(
          readOnly: widget.section.readonly ?? false,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
                widget.section.names?.getDescriptionLabelTranslated(context) ??
                    ''),
            hintText:
                widget.section.names?.getDescriptionLabelTranslated(context) ??
                    '',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          formControl: _control,
        );
      case FieldTypes.Decimal:
        return ReactiveTextField(
          readOnly: widget.section.readonly ?? false,
          keyboardType: const TextInputType.numberWithOptions(
              decimal: true, signed: false),
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
            label: Text(
                widget.section.names?.getDescriptionLabelTranslated(context) ??
                    ''),
            hintText:
                widget.section.names?.getDescriptionLabelTranslated(context) ??
                    '',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          formControl: _control,
        );
      default:
        return const SizedBox();
    }
  }

  // es Array String Build dropdown String
  Widget buildMultipleChild() {
    return const SizedBox();
  }
}
