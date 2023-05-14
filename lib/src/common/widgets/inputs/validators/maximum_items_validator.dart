import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class MaximumItemsValidator implements Validator<dynamic> {
  final int maximumItems;
  final String? errorMessage;

  MaximumItemsValidator(this.maximumItems, this.errorMessage);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value is List && control.value.length > maximumItems) {
      return {
        ExtValidationMessage.maximumItemsValidator:
            errorMessage ?? 'Too many items.'
      };
    }

    return null;
  }
}
