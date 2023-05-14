import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class MaximumLengthValidator extends Validator<dynamic> {
  final int maxLength;
  final String message;

  MaximumLengthValidator(this.maxLength, {this.message = ''});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;

    if (value != null && value.toString().length > maxLength) {
      return {ExtValidationMessage.maximumLengthValidator: message};
    }

    return null;
  }
}
