import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../utils/field_contains_enable_rule.dart';

mixin EnableIfRuleMixin {
  // initially sets the field in disabled mode if the dataProvider is enabled for the current field, to avoid inconsistencies.
  void initializeField(FormGroup form, Template template, {String? fieldId}) {
    if (fieldId != null && fieldId.isNotEmpty) {
      if (sectionFieldContainsEnableRule(
          template.enabledIfRules ?? [], fieldId)) {
        if (form.contains(fieldId)) {
          form.control(fieldId).markAsDisabled();
        }
      }
    }
  }

  // Initially sets the fieldgroup to disabled mode if the dataProvider for the current fieldgroup is enabled, to avoid inconsistencies.
  void initializeGroupField(FormGroup form, Template template,
      {String? fieldId}) {
    if (fieldId != null && fieldId.isNotEmpty) {
      if (sectionGroupContainsEnableRule(
          template.enabledIfRules ?? [], fieldId)) {
        if (form.contains(fieldId)) {
          form.control(fieldId).markAsDisabled();
        }
      }
    }
  }
}
