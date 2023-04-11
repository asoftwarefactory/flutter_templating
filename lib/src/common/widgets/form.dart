import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../models/form.dart';
import 'field.dart';

class FormWidget extends StatefulWidget {
  final FormModel form;

  const FormWidget({super.key, required this.form});

  @override
  FormWidgetState createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData = {};
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.form.name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...widget.form.fields
              .map((field) =>
                  FieldWidget(field: field, onSaved: _handleFieldSaved))
              .toList(),
        ],
      ),
    )
        .padding(const EdgeInsets.all(10))
        .border(borderSize: 1.5, radius: 25)
        .margin(const EdgeInsets.all(10));
  }

  void _handleFieldSaved(String name, dynamic value) {
    setState(() {
      formData[name] = value;
    });
  }
}
