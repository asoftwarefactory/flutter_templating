import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/providers/providers.dart';
import '../managers/data_providers_manager.dart';
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
    if (section.hidden == true) {
      return const SizedBox();
    } else {
      return Builder(builder: (context) {
        ref
            .read(dataProvidersManagerProvider.notifier)
            .onFieldInitialize(section);
        return _buildField(context, ref);
      });
    }
  }

  Widget _buildField(BuildContext ctx, WidgetRef ref) {
    final templateInput = ref.read(templateRenderInputProvider);
    if (section.type == SectionType.GROUP) {
      return SectionGroupWidget(section: section)
          .createMargin(templateInput.defaultMarginWidgets);
    } else if (section.type == SectionType.FIELD) {
      return SectionFieldWidget(section: section, form: mainForm)
          .createMargin(templateInput.defaultMarginWidgets);
    } else {
      return const SizedBox();
    }
  }
}
