import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MaximumConstDateValidator extends Validator<dynamic> {
  final DateTime maximumDate;
  final bool isArray;

  MaximumConstDateValidator(this.maximumDate, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final dynamic value = control.value;

    if (isArray && value is List<DateTime>) {
      for (final DateTime element in value) {
        if (!_isDateValid(element)) {
          return {ExtValidationMessage.maximumConstDateValidator: true};
        }
      }
    } else if (!_isDateValid(value)) {
      return {ExtValidationMessage.maximumConstDateValidator: true};
    }

    return null;
  }

  bool _isDateValid(DateTime date) {
    /* if (date == null) {
      return true;
    } */

    return date.isBefore(maximumDate) || date.isAtSameMomentAs(maximumDate);
  }
}
