import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class MinimumRelativeDateValidator extends Validator<dynamic> {
  final DateTime minimumDate;
  final String errorMessage;

  MinimumRelativeDateValidator(this.minimumDate, this.errorMessage);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == null || control.value == '') {
      return null;
    }

    final dateValue = DateTime.parse(control.value);
    final now = DateTime.now();
    final difference = dateValue.difference(now).inDays;

    if (difference < minimumDate.difference(now).inDays) {
      return {ExtValidationMessage.minimumRelativeDateValidator: errorMessage};
    }

    return null;
  }
}
