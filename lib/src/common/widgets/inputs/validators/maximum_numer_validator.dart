import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class MaximumNumberValidator extends Validator<dynamic> {
  final num maximum;

  MaximumNumberValidator(this.maximum);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value != null && control.value > maximum) {
      return {ExtValidationMessage.maximumNumberValidator: true};
    }
    return null;
  }
}
