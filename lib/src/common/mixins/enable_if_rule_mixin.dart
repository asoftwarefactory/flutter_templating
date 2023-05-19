import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/field_contains_enable_rule.dart';
import '../widgets/core_template_render_widget.dart';

mixin EnableIfRuleMixin {
  void initialize(WidgetRef ref, {String? fieldId}) {
    final template = ref.read(templateRenderInputProvider).template;
    final form = ref.read(mainFormGroupProvider);
    if (fieldId != null && fieldId.isNotEmpty) {
      if (fieldContainsEnableRule(template.enabledIfRules ?? [], fieldId)) {
        if (form.contains(fieldId)) {
          form.control(fieldId).markAsDisabled();
        }
      }
    }
  }
}
