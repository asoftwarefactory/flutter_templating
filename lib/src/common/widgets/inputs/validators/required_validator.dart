import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class RequiredValidator extends Validator<dynamic> {
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
}
