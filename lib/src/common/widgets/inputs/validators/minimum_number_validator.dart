import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class MinimumNumberValidator extends Validator<dynamic> {
  final num minValue;

  MinimumNumberValidator(this.minValue);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value != null && control.value < minValue) {
      return {ExtValidationMessage.minimumNumberValidator: true};
    }
    return null;
  }
}
