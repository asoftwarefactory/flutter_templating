import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MinimumLengthValidator extends Validator<dynamic> {
  final int minimumLength;
  final bool isArray;

  MinimumLengthValidator(this.minimumLength, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final dynamic value = control.value;

    if (isArray && value is List) {
      for (final item in value) {
        if (item.toString().length < minimumLength) {
          return {ExtValidationMessage.minimumLengthValidator: true};
        }
      }
    } else if (value.toString().length < minimumLength) {
      return {ExtValidationMessage.minimumLengthValidator: true};
    }

    return null;
  }
}
