import 'package:flutter_templating/src/common/models/template.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FieldModel {
  final String? label;
  final FieldTypes type;
  
  final FormControl formControl;

  FieldModel({required this.formControl, this.label, required this.type});
}
