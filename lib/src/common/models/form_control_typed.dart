import 'package:reactive_forms/reactive_forms.dart';
import 'template.dart';

class FormControlTyped<T> extends FormControl<T> {
  final FieldTypes type;
  FormControlTyped({
    required this.type,
    T? value,
    List<Map<String, dynamic>? Function(AbstractControl<dynamic>)> validators =
        const [],
    List<Future<Map<String, dynamic>?> Function(AbstractControl<dynamic>)>
        asyncValidators = const [],
    int asyncValidatorsDebounceTime = 250,
    bool touched = false,
    bool disabled = false,
  }) : super(
          value: value,
          validators: validators,
          asyncValidators: asyncValidators,
          asyncValidatorsDebounceTime: asyncValidatorsDebounceTime,
          touched: touched,
          disabled: disabled,
        );
}
