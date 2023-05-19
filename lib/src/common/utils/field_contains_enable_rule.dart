import '../models/template.dart';

bool fieldContainsEnableRule(List<EnabledIfRule> rules, String fieldId) {
  return rules.any((rule) => (rule.fieldIds ?? []).contains(fieldId));
}
