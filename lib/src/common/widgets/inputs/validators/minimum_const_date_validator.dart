import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MinimumConstDateValidator extends Validator<dynamic> {
  final DateTime minimumDate;
  final bool isArray;

  MinimumConstDateValidator(this.minimumDate, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final dynamic value = control.value;

    if (isArray && value is List) {
      for (final dynamic element in value) {
        if (_isDateBelow(element)) {
          return {ExtValidationMessage.minimumConstDateValidator: true};
        }
      }
    } else if (_isDateBelow(value)) {
      return {ExtValidationMessage.minimumConstDateValidator: true};
    }

    return null;
  }

  bool _isDateBelow(dynamic value) {
    if (value == null) {
      return false;
    }

    if (value is DateTime) {
      return value.isBefore(minimumDate);
    }

    return false;
  }
}
