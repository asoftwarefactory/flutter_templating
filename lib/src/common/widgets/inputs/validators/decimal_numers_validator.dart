import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class DecimalNumbersValidator extends Validator<dynamic> {
  final int decimalDigits;
  final bool isArray;

  DecimalNumbersValidator(this.decimalDigits, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final dynamic value = control.value;

    if (isArray && value is List<num>) {
      for (final num element in value) {
        if (!_isValidDecimal(element)) {
          return {ExtValidationMessage.decimalNumbersValidator: true};
        }
      }
    } else if (!_isValidDecimal(value)) {
      return {ExtValidationMessage.decimalNumbersValidator: true};
    }

    return null;
  }

  bool _isValidDecimal(num value) {
    /* if (value == null) {
      return true;
    } */

    final stringValue = value.toString();
    final decimalIndex = stringValue.indexOf('.');
    if (decimalIndex != -1) {
      final decimalPart = stringValue.substring(decimalIndex + 1);
      if (decimalPart.length > decimalDigits) {
        return false;
      }
    }

    return true;
  }
}



/* class DecimalNumbersValidator extends Validator<dynamic> {
  final int decimalDigits;

  DecimalNumbersValidator(this.decimalDigits);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;

    if (value != null && value is num) {
      final stringValue = value.toString();
      final decimalIndex = stringValue.indexOf('.');
      if (decimalIndex != -1) {
        final decimalPart = stringValue.substring(decimalIndex + 1);
        if (decimalPart.length > decimalDigits) {
          return {ExtValidationMessage.decimalNumbersValidator: true};
        }
      }
    }

    return null;
  }
} */