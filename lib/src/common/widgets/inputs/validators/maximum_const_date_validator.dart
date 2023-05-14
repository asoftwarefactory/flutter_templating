import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MaximumConstDateValidator extends Validator<dynamic> {
  final String errorMessage;
  final String maximumDate;

  MaximumConstDateValidator(this.maximumDate, [this.errorMessage = '']);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = {
      ExtValidationMessage.maximumConstDateValidator: errorMessage
    };

    if (control.value == null || control.value.isEmpty) {
      return null;
    }

    final inputDateFormat = DateFormat('yyyy-MM-dd');
    final maximumDateFormatted = inputDateFormat.parse(maximumDate);

    if (control.value.isBefore(maximumDateFormatted)) {
      return null;
    }

    return error;
  }
}
