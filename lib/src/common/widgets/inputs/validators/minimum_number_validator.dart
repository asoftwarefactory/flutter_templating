import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MinimumNumberValidator extends Validator<dynamic> {
  final num minValue;
  final bool isArray;

  MinimumNumberValidator(this.minValue, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;

    if (isArray && value is List) {
      final List<num> numbers = value.whereType<num>().toList();

      if (numbers.isEmpty || numbers.any((num number) => number < minValue)) {
        return {ExtValidationMessage.minimumNumberValidator: true};
      }
    } else if (value is num && value < minValue) {
      return {ExtValidationMessage.minimumNumberValidator: true};
    }

    return null;
  }
}
