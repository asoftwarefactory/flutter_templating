import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MaximumNumberValidator extends Validator<dynamic> {
  final num maximumNumber;
  final bool isArray;

  MaximumNumberValidator(this.maximumNumber, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final dynamic value = control.value;

    if (isArray && value is List) {
      for (final dynamic element in value) {
        if (_isNumberExceeded(element)) {
          return {ExtValidationMessage.maximumNumberValidator: true};
        }
      }
    } else if (_isNumberExceeded(value)) {
      return {ExtValidationMessage.maximumNumberValidator: true};
    }

    return null;
  }

  bool _isNumberExceeded(dynamic value) {
    if (value == null) {
      return false;
    }

    if (value is num) {
      return value > maximumNumber;
    }

    return false;
  }
}
/* class MaximumNumberValidator extends Validator<dynamic> {
  final num maximum;

  MaximumNumberValidator(this.maximum);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value != null && control.value > maximum) {
      return {ExtValidationMessage.maximumNumberValidator: true};
    }
    return null;
  }
} */