import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class RegexValidator extends Validator<dynamic> {
  final RegExp regex;
  final bool isArray;

  RegexValidator(this.regex, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;

    if (isArray && value is List) {
      final List<String> strings = value.whereType<String>().toList();

      if (strings.isEmpty ||
          strings.any((String str) => !regex.hasMatch(str))) {
        return {ExtValidationMessage.regexValidator: true};
      }
    } else if (value is String && !regex.hasMatch(value)) {
      return {ExtValidationMessage.regexValidator: true};
    }

    return null;
  }
}
