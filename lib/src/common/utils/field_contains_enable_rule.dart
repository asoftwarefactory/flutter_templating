import '../models/template.dart';

bool sectionFieldContainsEnableRule(List<EnabledIfRule> rules, String fieldId) {
  return rules.any((rule) => (rule.fieldIds ?? []).contains(fieldId));
}

bool sectionGroupContainsEnableRule(
    List<EnabledIfRule> rules, String groupFieldId) {
  return rules.any((rule) => (rule.groupIds ?? []).contains(groupFieldId));
}
