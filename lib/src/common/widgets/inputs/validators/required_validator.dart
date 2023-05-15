import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class RequiredValidator extends Validator<dynamic> {
  final bool isArray;

  RequiredValidator({this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;

    if (isArray && value is List) {
      if (value.isEmpty) {
        return {ExtValidationMessage.requiredValidator: true};
      }
    } else if (value == null || value.toString().isEmpty) {
      return {ExtValidationMessage.requiredValidator: true};
    }

    return null;
  }
}
