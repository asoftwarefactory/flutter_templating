import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/providers/providers.dart';
import 'section_field_widget.dart';
import 'section_group_widget.dart';

class SectionStepWidget extends ConsumerWidget {
  final Section section;
  final FormGroup mainForm;
  const SectionStepWidget({
    super.key,
    required this.section,
    required this.mainForm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // hidden Feature
    if (section.hidden == true || section.id == null) {
      return const SizedBox();
    } else {
      return _buildField(context, ref);
    }
  }

  Widget _buildField(BuildContext context, WidgetRef ref) {
    if (section.type == SectionType.GROUP) {
      return SectionGroupWidget(section: section, form: mainForm).createMargin(
          ref.read(templateRenderInputProvider).defaultMarginWidgets);
    } else if (section.type == SectionType.FIELD) {
      return SectionFieldWidget(
        section: section,
        form: mainForm,
      ).createMargin(
          ref.read(templateRenderInputProvider).defaultMarginWidgets);
    } else {
      return const SizedBox();
    }
  }
}



/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/managers/enable_if_rule.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/providers/providers.dart';
import '../extensions/abstract_control.dart';
import 'reactive_value_listenable_builder_multiple.dart';
import 'section_field_widget.dart';
import 'section_group_widget.dart';

class SectionStepWidget extends ConsumerWidget {
  final Section section;
  final FormGroup mainForm;
  const SectionStepWidget({
    super.key,
    required this.section,
    required this.mainForm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // hidden Feature
    if (section.hidden == true || section.id == null) {
      return const SizedBox();
    } else {
      return _buildField(context, ref);
    }
  }

  Widget _buildField(BuildContext context, WidgetRef ref) {
    final template = ref.read(templateRenderInputProvider).template;

    if (section.type == SectionType.GROUP) {
      return SectionGroupWidget(section: section, form: mainForm).createMargin(
          ref.read(templateRenderInputProvider).defaultMarginWidgets);
    } else if (section.type == SectionType.FIELD) {
      final enableRulesWithSectionField = (template.enabledIfRules ?? [])
          .where((rule) =>
              (rule.fieldIds ?? []).any((fieldId) => section.id! == fieldId))
          .toList();

      if (enableRulesWithSectionField.isNotEmpty) {
        return SectionFieldWidget(section: section, form: mainForm)
            .createMargin(
                ref.read(templateRenderInputProvider).defaultMarginWidgets);
      } else {
        final completedForm = ref.read(mainFormProvider);
        final conditionsControl = (enableRulesWithSectionField
                .map((rule) => rule.conditions)
                .toList())
            .expand((element) => element ?? <EnabledIfCondition>[])
            .toList();
        final conditionsFormControls = conditionsControl
            .map((condition) => condition.fieldId != null
                ? ExtAbstractControl.controlNested(
                    condition.fieldId!, completedForm)
                : null)
            .where((element) => element != null)
            .map((w) =>
                ReactiveValueListenableBuilderMultipleData(formControl: w))
            .toList();

        debugPrint(
            "conditionsFormControls.isEmpty => ${conditionsFormControls.isEmpty}");

        final manager = EnableIfRuleManager();
        return ReactiveValueListenableBuilderMultiple(
          onValueChanged: () {
            debugPrint("value changedwoidqiodh");
            for (final control in conditionsFormControls) {
              for (final condition in conditionsControl) {
                final manipulateControl = ExtAbstractControl.controlNested(
                    section.id!, completedForm);
                if (control.formControl != null && manipulateControl != null) {
                  manager.manipulateStateFormControl(
                      manipulateControl, control.formControl!, condition);
                }
              }
            }
          },
          builder: (context, _) {
            return SectionFieldWidget(section: section, form: mainForm)
                .createMargin(
                    ref.read(templateRenderInputProvider).defaultMarginWidgets);
          },
          controls: conditionsFormControls,
        );
      }
    } else {
      return const SizedBox();
    }
  }
}
 */