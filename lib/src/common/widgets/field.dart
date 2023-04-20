import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../models/field.dart';
import '../models/template.dart';

class FieldWidget extends StatelessWidget {
  final FieldModel field;

  const FieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    switch (field.type) {
      case FieldTypes.String:
        return ReactiveTextField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(field.label ?? ''),
            hintText: field.label,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            helperText: '',
            // suffixIcon: const Icon(Icons.calendar_today),
          ),
          /*  decoration: InputDecoration(
            labelText: field.label,
          ), */
          formControl: field.formControl,
        );

      /* case 'number':
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.name,
          ),
          keyboardType: TextInputType.number,
          // onSaved: (value) => onSaved(field.name, value),
        );
      case 'email':
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.name,
          ),
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) => onSaved(field.name, value),
        );
      case 'password':
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.name,
          ),
          obscureText: true,
          onSaved: (value) => onSaved(field.name, value),
        );
      case 'checkbox':
        return CheckboxListTile(
          title: Text(field.name),
          value: false,
          onChanged: (value) => onSaved(field.name, value),
        ); */
      default:
        return const SizedBox();
    }
  }
}
