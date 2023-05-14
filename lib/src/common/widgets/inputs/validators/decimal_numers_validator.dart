import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class DecimalNumbersValidator extends Validator<dynamic> {
  final int decimalPlaces;

  DecimalNumbersValidator({this.decimalPlaces = 2});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value?.toString() ?? '';

    // regex to validate decimal numbers with the given decimal places
    // TODO :
    final pattern = RegExp(r'^-?[0-9]+(\.[0-9]{1,$decimalPlaces})?$');

    if (!pattern.hasMatch(value)) {
      return {ExtValidationMessage.decimalNumbersValidator: true};
    }

    return null;
  }
}
