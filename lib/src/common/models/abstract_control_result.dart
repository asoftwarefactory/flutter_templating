import 'package:reactive_forms/reactive_forms.dart';
import '../enums/abstract_control_type.dart';

class AbstractControlResult<T> {
  final AbstractControl<T> control;
  final AbstractControlType type;
  AbstractControlResult({
    required this.control,
    required this.type,
  });
}
