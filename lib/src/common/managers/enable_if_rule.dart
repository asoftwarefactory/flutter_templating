import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../models/template.dart';

class EnableIfRuleManager {
  static void _reactiveFormListener(
    BuildContext ctx,
    List<EnabledIfRule>? enableIfRules,
    FormGroup form,
    void Function(EnabledIfRule enableIfRule, FormGroup form) fn,
  ) async {
    // dispose sub ??
    // ignore: unused_local_variable
    final sub = form.valueChanges.listen((v) async {
      for (var rule in enableIfRules ?? <EnabledIfRule>[]) {
        fn.call(rule, form);
      }
    });
  }

  static void initializeEnableIfRule(
    BuildContext context,
    List<EnabledIfRule>? enableIfRules,
    FormGroup form,
  ) async {
    return await Future.sync(() {
      return _reactiveFormListener(context, enableIfRules, form, (rule, form) {
        for (var fieldId in rule.fieldIds ?? <String>[]) {
          if (form.contains(fieldId)) {
            final mainControl = form.control(fieldId);

            for (var condition in rule.conditions ?? <EnabledIfCondition>[]) {
              if (condition.fieldId != null &&
                  form.contains(condition.fieldId!)) {
                final conditionControl = form.control(condition.fieldId!);

                final conditionValues = condition.values ?? <dynamic>[];
                switch (condition.constraint) {
                  case EnabledIfConstraints.ContainsAll:
                    if (conditionControl.value != null) {
                      if (conditionValues
                          .every((e) => e == conditionControl.value)) {
                        mainControl.markAsEnabled();
                      } else {
                        mainControl.markAsDisabled();
                      }
                    } else {
                      mainControl.markAsDisabled();
                    }

                    break;
                  case EnabledIfConstraints.ContainsOne:
                    if (conditionValues
                        .any((e) => e == conditionControl.value)) {
                      mainControl.markAsEnabled();
                    } else {
                      mainControl.markAsDisabled();
                    }
                    break;
                  case EnabledIfConstraints.Equal:
                    if (conditionValues
                        .every((e) => e == conditionControl.value)) {
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
                    if (conditionValues
                        .every((e) => e != conditionControl.value)) {
                      mainControl.markAsEnabled();
                    } else {
                      mainControl.markAsDisabled();
                    }

                    break;

                  default:
                }
              }
            }
          }
        }
      });
    });
  }
}
