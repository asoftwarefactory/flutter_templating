import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';
import 'package:intl/intl.dart';

class MinimumRelativeDateValidator extends Validator<dynamic> {
  final DateTime minDate;
  final bool isArray;

  MinimumRelativeDateValidator(this.minDate, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;

    if (isArray && value is List) {
      final List<DateTime> dates = value.whereType<DateTime>().toList();

      if (dates.isEmpty ||
          dates.any((DateTime date) => date.isBefore(minDate))) {
        return {ExtValidationMessage.minimumRelativeDateValidator: true};
      }
    } else if (value is DateTime && value.isBefore(minDate)) {
      return {ExtValidationMessage.minimumRelativeDateValidator: true};
    }

    return null;
  }

  @override
  String toString() {
    final formatter = DateFormat('yyyy-MM-dd');
    final minDateString = formatter.format(minDate);
    return 'MinimumRelativeDateValidator(minDate: $minDateString, isArray: $isArray)';
  }
}

/* class MinimumRelativeDateValidator extends Validator<dynamic> {
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
} */
