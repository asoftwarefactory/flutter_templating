import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MaximumLengthValidator extends Validator<dynamic> {
  final int maximumLength;
  final bool isArray;

  MaximumLengthValidator(this.maximumLength, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final dynamic value = control.value;

    if (isArray && value is List) {
      for (final dynamic element in value) {
        if (_isLengthExceeded(element)) {
          return {ExtValidationMessage.maximumLengthValidator: true};
        }
      }
    } else if (_isLengthExceeded(value)) {
      return {ExtValidationMessage.maximumLengthValidator: true};
    }

    return null;
  }

  bool _isLengthExceeded(dynamic value) {
    if (value == null) {
      return false;
    }

    if (value is String) {
      return value.length > maximumLength;
    }

    return false;
  }
}
