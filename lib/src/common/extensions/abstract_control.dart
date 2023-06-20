import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../enums/abstract_control_type.dart';
import '../models/abstract_control_result.dart';
import '../models/form_control_typed.dart';

extension ExtAbstractControl on AbstractControl {
  void pushValidators(
    List<Validator<dynamic>> otherValidators, {
    bool autoValidate = false,
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    return setValidators(
      [...validators, ...otherValidators],
      autoValidate: autoValidate,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void pushValidator(
    Validator<dynamic> otherValidator, {
    bool autoValidate = false,
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    return pushValidators(
      [otherValidator],
      autoValidate: autoValidate,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  /// iterate all elements presents into AbstractControl, also grafted elements
  void forEachChildAll(void Function(AbstractControlResult result) fn) {
    // ignore: invalid_use_of_protected_member
    return forEachChild((data) {
      if (data is FormArray) {
        // it must be called the first time because otherwise the information is lost
        fn.call(
          AbstractControlResult(
            control: data,
            type: AbstractControlType.array,
          ),
        );
        // iterate recursively
        data.forEachChildAll((data1) {
          fn.call(data1);
        });
      } else if (data is FormGroup) {
        // it must be called the first time because otherwise the information is lost
        fn.call(
          AbstractControlResult(
            control: data,
            type: AbstractControlType.group,
          ),
        );
        // iterate recursively
        data.forEachChildAll((data1) {
          fn.call(data1);
        });
      } else if (data is FormControl) {
        // default
        if (data is FormControlTyped) {
          // default
          fn.call(
            AbstractControlResult(
              control: data,
              type: AbstractControlType.standardControlTyped,
            ),
          );
        } else {
          fn.call(
            AbstractControlResult(
              control: data,
              type: AbstractControlType.standardControl,
            ),
          );
        }
      } else {
        // default
        fn.call(
          AbstractControlResult(
            control: data,
            type: AbstractControlType.dynamic,
          ),
        );
      }
    });
  }

  List<AbstractControlResult> getAllControls() {
    final data = <AbstractControlResult>[];
    forEachChildAll((p0) {
      data.add(p0);
    });
    return data;
  }

  static AbstractControl<dynamic>? controlNested(
      String controlId, AbstractControl<dynamic> control) {
    if (control is FormGroup) {
      // Check if the current control has the desired ID
      if (control.contains(controlId)) {
        return control.control(controlId);
      } else {
        // Iterate recursively over the nested controls
        for (final key in control.controls.keys) {
          final nestedControl = controlNested(controlId, control.control(key));
          if (nestedControl != null) {
            return nestedControl;
          }
        }
      }
    }

    // If no matching control is found, I return null
    return null;
  }

  static AbstractControl<T> getControl<T>(
    BuildContext context, {
    String? formControlName,
    AbstractControl<T>? formControl,
  }) {
    var control = formControl;
    if (control == null) {
      final form = ReactiveForm.of(context, listen: false);
      if (form == null || form is! FormControlCollection) {
        throw FormControlParentNotFoundException(context.widget);
      }

      final collection = form as FormControlCollection;
      control = collection.control(formControlName!) as AbstractControl<T>;
    }
    return control;
  }
}
