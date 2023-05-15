import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class ExtensionsValidator extends Validator<dynamic> {
  final List<String> allowedExtensions;
  final bool isArray;

  ExtensionsValidator(this.allowedExtensions, {this.isArray = false});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final dynamic value = control.value;

    if (isArray && value is List<String>) {
      for (final String element in value) {
        if (!_isValidExtension(element)) {
          return {ExtValidationMessage.extensionsValidator: true};
        }
      }
    } else if (!_isValidExtension(value)) {
      return {ExtValidationMessage.extensionsValidator: true};
    }

    return null;
  }

  bool _isValidExtension(String value) {
    /* if (value == null) {
      return true;
    } */

    final extension = value.split('.').last;
    return allowedExtensions.contains(extension);
  }
}

/* class ExtensionsValidator {
  static Map<String, String>? Function(AbstractControl control) validate(
      List<String> allowedExtensions) {
    return (AbstractControl<dynamic> control) {
      final value = control.value;
      if (value == null) {
        return null;
      }

      final fileExtension = value.split('.').last;
      return allowedExtensions.contains(fileExtension.toLowerCase())
          ? null
          : {
              ExtValidationMessage.extensionsValidator:
                  'Invalid file extension. Allowed extensions: ${allowedExtensions.join(", ")}'
            };
    };
  }
} */
