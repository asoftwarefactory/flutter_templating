import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MaximumRelativeDateValidator extends Validator<dynamic> {
  final DateTime maximumDate;
  final bool isArray;

  MaximumRelativeDateValidator(this.maximumDate, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final dynamic value = control.value;

    if (isArray && value is List) {
      for (final dynamic element in value) {
        if (_isDateExceeded(element)) {
          return {ExtValidationMessage.maximumRelativeDateValidator: true};
        }
      }
    } else if (_isDateExceeded(value)) {
      return {ExtValidationMessage.maximumRelativeDateValidator: true};
    }

    return null;
  }

  bool _isDateExceeded(dynamic value) {
    if (value == null) {
      return false;
    }

    if (value is DateTime) {
      return value.isAfter(maximumDate);
    }

    return false;
  }
}

/* class MaximumRelativeDateValidator extends Validator<dynamic> {
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
} */