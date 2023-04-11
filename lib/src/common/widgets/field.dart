import 'package:flutter/material.dart';
import '../models/field.dart';

class FieldWidget extends StatelessWidget {
  final FieldModel field;
  final Function(String, dynamic) onSaved;

  const FieldWidget({super.key, required this.field, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    switch (field.type) {
      case 'text':
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.name,
          ),
          onSaved: (value) => onSaved(field.name, value),
        );
      case 'number':
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.name,
          ),
          keyboardType: TextInputType.number,
          onSaved: (value) => onSaved(field.name, value),
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
        );
      default:
        return const SizedBox();
    }
  }
}
