import 'package:reactive_forms/reactive_forms.dart';

import 'validation_message.dart';

class MinimumItemsValidator extends Validator<dynamic> {
  final int minimum;

  MinimumItemsValidator(this.minimum);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final List<dynamic>? value = control.value;
    if (value == null || value.length < minimum) {
      return {
        ExtValidationMessage.minimumItemsValidator: {'requiredLength': minimum}
      };
    }
    return null;
  }
}
