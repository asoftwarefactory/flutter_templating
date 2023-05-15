import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class RequiredValidator extends Validator<dynamic> {
  final bool isArray;

  RequiredValidator({this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;

    if (isArray && value is List) {
      if (value.isEmpty) {
        return {ExtValidationMessage.requiredValidator: true};
      }
    } else if (value == null || value.toString().isEmpty) {
      return {ExtValidationMessage.requiredValidator: true};
    }

    return null;
  }
}

/* class RequiredValidator extends Validator<dynamic> {
  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = <String, dynamic>{
      ExtValidationMessage.requiredValidator: true
    };

    if (control.value == null) {
      return error;
    } else if (control.value is String) {
      return (control.value as String).trim().isEmpty ? error : null;
    } else if (control.value is List) {
      return (control.value as List).isEmpty ? error : null;
    }

    return null;
  }
} */