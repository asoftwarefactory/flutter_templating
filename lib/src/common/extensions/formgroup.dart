import 'package:reactive_forms/reactive_forms.dart';
import '../models/template.dart';
import '../widgets/inputs/validators/manager.dart';

extension FormGroupExt on FormGroup {
  /*  AbstractControl<T> getOrSetAbstractControl<T>(
      String controlId, AbstractControl<T> Function() ifNotExistControl) {
    final form = this;
    if (form.controls.containsKey(controlId)) {
      return form.control(controlId) as AbstractControl<T>;
    } else {
      final control = ifNotExistControl();
      form.addAll({controlId: control});

      return control;
    }
  } */

  void setAbstractControlAndValidator<T>(
      String controlId, AbstractControl<T> Function() ifNotExistControl,
      {bool isArray = false, List<FieldValidator>? validators}) {
    final control = ifNotExistControl();
    ValidatorsManager.initializeValidators(
      control,
      validators ?? [],
      isArray,
    );
    addAll({controlId: control});
    return;
  }

  AbstractControl<T> getOrSetAbstractControlAndSetValidators<T>(
      String controlId, AbstractControl<T> Function() ifNotExistControl,
      {bool isArray = false, List<FieldValidator>? validators}) {
    if (controls.containsKey(controlId)) {
      return control(controlId) as AbstractControl<T>;
    } else {
      setAbstractControlAndValidator(controlId, ifNotExistControl,
          isArray: isArray, validators: validators);
      return control(controlId) as AbstractControl<T>;
    }
  }
}
