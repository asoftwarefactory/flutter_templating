import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_forms/reactive_forms.dart';
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
      final form = mainForm.getOrSetAbstractControlAndSetValidators(
        section.id!,
        () => FormGroup({}),
        isArray: section.isArray ?? false,
        validators: section.validators,
      ) as FormGroup;
      return SectionGroupWidget(section: section, form: form).createMargin(
        ref.read(templateRenderInputProvider).defaultMarginWidgets,
      );
    } else if (section.type == SectionType.FIELD) {
      return SectionFieldWidget(
        section: section,
        form: mainForm,
      ).createMargin(
        ref.read(templateRenderInputProvider).defaultMarginWidgets,
      );
    } else {
      return const SizedBox();
    }
  }
}
