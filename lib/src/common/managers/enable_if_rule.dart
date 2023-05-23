import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../extensions/abstract_control.dart';
import '../models/template.dart';

class EnableIfRuleManager {
  StreamSubscription<Map<String, Object?>?>? _sub;

  void initializeEnableIfRule(
    BuildContext context,
    List<EnabledIfRule>? enableIfRules,
    FormGroup form,
  ) async {
    void initialize() {
      for (var rule in enableIfRules ?? <EnabledIfRule>[]) {
        for (var fieldId in rule.fieldIds ?? <String>[]) {
          final mainControl = ExtAbstractControl.controlNested(fieldId, form);
          if (mainControl != null) {
            for (var condition in rule.conditions ?? <EnabledIfCondition>[]) {
              if (condition.fieldId != null) {
                final conditionControl =
                    ExtAbstractControl.controlNested(condition.fieldId!, form);
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

        for (var groupId in rule.groupIds ?? <String>[]) {
          final mainControl = ExtAbstractControl.controlNested(groupId, form);
          if (mainControl != null) {
            for (var condition in rule.conditions ?? <EnabledIfCondition>[]) {
              if (condition.fieldId != null) {
                final conditionControl =
                    ExtAbstractControl.controlNested(condition.fieldId!, form);
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
    }
  }

  void dispose() => _sub?.cancel();
}
