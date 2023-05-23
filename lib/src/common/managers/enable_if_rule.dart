import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/abstract_control.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../enums/abstract_control_type.dart';
import '../models/template.dart';

class EnableIfRuleManager {
  StreamSubscription<Map<String, Object?>?>? _sub;
  AbstractControl<dynamic>? getControl(String name, FormGroup mainForm) {
    if (mainForm.contains(name)) {
      return mainForm.control(name);
    } else {
      for (var cr in mainForm.getAllControls()) {
        switch (cr.type) {
          case AbstractControlType.array:
            return null;
          case AbstractControlType.dynamic:
            return null;
          case AbstractControlType.group:
            final formGroup = cr.control as FormGroup;
            if (formGroup.contains(name)) {
              return formGroup.control(name);
            } else {
              return null;
            }
          case AbstractControlType.standardControl:
            return null;
          case AbstractControlType.standardControlTyped:
            return null;
          default:
            return null;
        }
      }
      return null;
    }
  }

  void initializeEnableIfRule(
    BuildContext context,
    List<EnabledIfRule>? enableIfRules,
    FormGroup form,
  ) async {
    void initialize() {
      for (var rule in enableIfRules ?? <EnabledIfRule>[]) {
        for (var fieldId in rule.fieldIds ?? <String>[]) {
          final mainControl = getControl(fieldId, form);
          if (mainControl != null) {
            for (var condition in rule.conditions ?? <EnabledIfCondition>[]) {
              if (condition.fieldId != null) {
                final conditionControl = getControl(condition.fieldId!, form);
                if (conditionControl != null) {
                  _manipulateStateFormControl(
                    mainControl,
                    conditionControl,
                    condition,
                  );
                }
              }
            }
          }
        }
      }
    }

    _sub = form.valueChanges
        .distinct((a, b) => (a ?? <String, dynamic>{}) == b)
        .listen((event) {
      initialize();
    });
  }

  void _manipulateStateFormControl(
    AbstractControl<dynamic> mainControl,
    AbstractControl<dynamic> conditionControl,
    EnabledIfCondition condition,
  ) {
    final conditionValues = condition.values ?? <dynamic>[];
    switch (condition.constraint) {
      case EnabledIfConstraints.ContainsAll:
        if (conditionControl.value != null) {
          if (conditionValues.every((e) => e == conditionControl.value)) {
            mainControl.markAsEnabled();
          } else {
            mainControl.markAsDisabled();
          }
        } else {
          mainControl.markAsDisabled();
        }

        break;
      case EnabledIfConstraints.ContainsOne:
        if (conditionValues.any((e) => e == conditionControl.value)) {
          mainControl.markAsEnabled();
        } else {
          mainControl.markAsDisabled();
        }
        break;
      case EnabledIfConstraints.Equal:
        if (conditionValues.every((e) => e == conditionControl.value)) {
          mainControl.markAsEnabled();
        } else {
          mainControl.markAsDisabled();
        }

        break;
      case EnabledIfConstraints.GreaterOrEqualThan:
        if (conditionValues.every((e) =>
            conditionControl.value != null &&
            conditionControl.value is num &&
            conditionControl.value >= e)) {
          mainControl.markAsEnabled();
        } else {
          mainControl.markAsDisabled();
        }

        break;
      case EnabledIfConstraints.GreaterThan:
        if (conditionValues.every((e) =>
            conditionControl.value != null &&
            conditionControl.value is num &&
            conditionControl.value > e)) {
          mainControl.markAsEnabled();
        } else {
          mainControl.markAsDisabled();
        }
        break;

      case EnabledIfConstraints.LessOrEqualThan:
        if (conditionValues.every((e) =>
            conditionControl.value != null &&
            conditionControl.value is num &&
            conditionControl.value <= e)) {
          mainControl.markAsEnabled();
        } else {
          mainControl.markAsDisabled();
        }

        break;
      case EnabledIfConstraints.LessThan:
        if (conditionValues.every((e) =>
            conditionControl.value != null &&
            conditionControl.value is num &&
            conditionControl.value < e)) {
          mainControl.markAsEnabled();
        } else {
          mainControl.markAsDisabled();
        }
        break;
      case EnabledIfConstraints.NotEqual:
        if (conditionValues.every((e) => e != conditionControl.value)) {
          mainControl.markAsEnabled();
        } else {
          mainControl.markAsDisabled();
        }

        break;

      default:
        debugPrint("def def");
    }
  }

  void dispose() => _sub?.cancel();
}
