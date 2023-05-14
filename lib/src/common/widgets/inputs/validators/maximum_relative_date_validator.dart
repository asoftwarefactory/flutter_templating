import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class MaximumRelativeDateValidator extends Validator<dynamic> {
  final int days;
  final String message;

  MaximumRelativeDateValidator(this.days,
      {this.message = 'Date is too far in the future'});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == null) {
      return null;
    }

    final currentDate = DateTime.now();
    final maxDate = currentDate.subtract(Duration(days: days));

    if (control.value.isAfter(maxDate)) {
      return {ExtValidationMessage.maximumRelativeDateValidator: message};
    }

    return null;
  }
}
