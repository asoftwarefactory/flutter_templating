import 'package:reactive_forms/reactive_forms.dart';
import 'validation_message.dart';

class MaximumItemsValidator implements Validator<dynamic> {
  final int maximumItems;

  MaximumItemsValidator(this.maximumItems);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value is List && control.value.length > maximumItems) {
      return {ExtValidationMessage.maximumItemsValidator: true};
    }

    return null;
  }
}
