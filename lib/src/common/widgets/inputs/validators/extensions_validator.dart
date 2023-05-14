import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class ExtensionsValidator {
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
}
