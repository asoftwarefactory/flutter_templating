import 'package:reactive_forms/reactive_forms.dart';
import '../enums/abstract_control_type.dart';
import '../models/abstract_control_result.dart';
import '../models/form_control_typed.dart';

extension ExtAbstractControl on AbstractControl {
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
}
