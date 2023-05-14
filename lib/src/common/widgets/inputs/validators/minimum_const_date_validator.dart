import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class MinimumConstDateValidator extends Validator<dynamic> {
  final DateTime minimumDate;

  MinimumConstDateValidator(this.minimumDate);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value as DateTime?;

    if (value != null && value.isBefore(minimumDate)) {
      return {ExtValidationMessage.minimumConstDateValidator: true};
    }

    return null;
  }
}
