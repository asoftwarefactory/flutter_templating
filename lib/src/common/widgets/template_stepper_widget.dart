import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/section.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/template_step.dart';
import 'package:flutter_templating/src/common/widgets/section_step_widget.dart';
import '../notifiers/indexed_notifier.dart';
import 'custom_main_text.dart';
import 'save_template_button.dart';

class TemplateStepperWidget extends StatelessWidget {
  final Template template;
  final FormGroup formGroupTemplate;

  const TemplateStepperWidget({
    Key? key,
    required this.template,
    required this.formGroupTemplate,
  }) : super(key: key);

  // definitions Sections with steps.
  @override
  Widget build(BuildContext context) {
    final templateStepperBuilderProvider =
        StateNotifierProvider<IndexedNotifier, int>((ref) => IndexedNotifier());
    return Consumer(
      builder: (context, ref, child) {
        final index = ref.watch(templateStepperBuilderProvider);
        return Stepper(
          controlsBuilder: (ctx, details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: details.onStepCancel,
                  icon: const Icon(Icons.arrow_upward_rounded),
                ),
                ref.read(templateRenderInputProvider).defaultGapRow,
                // if the user is performing the last step
                if (details.stepIndex == (template.steps?.length ?? 0) - 1)
                  const SaveTemplateButton(),
                // if the user is not performing the last step
                if (details.stepIndex != (template.steps?.length ?? 0) - 1)
                  IconButton(
                    icon: const Icon(Icons.arrow_downward_rounded),
                    onPressed: details.onStepContinue,
                  ),
              ],
            ).createMargin(
                ref.read(templateRenderInputProvider).defaultMarginWidgets);
          },
          onStepCancel: () {
            if (index > 0) {
              return ref
                  .read(templateStepperBuilderProvider.notifier)
                  .decrement();
            }
          },
          onStepContinue: () {
            if (index < ((template.steps?.length ?? 0) - 1)) {
              return ref
                  .read(templateStepperBuilderProvider.notifier)
                  .increment();
            }
          },
          onStepTapped: (value) {
            return ref.read(templateStepperBuilderProvider.notifier).set(value);
          },
          currentStep: index,
          steps: template.steps?.map((step) {
                final sectionsFromStep =
                    step.getSectionsFromStep(template.sections ?? []);
                return Step(
                  state: StepState.indexed,
                  content: Column(
                    children: sectionsFromStep.map((section) {
                      return SectionStepWidget(
                        formGroupTemplate: formGroupTemplate,
                        section: section.getAndOrderChildrenByTypeField(),
                      );
                    }).toList(),
                  ),
                  title: CustomMainText(
                    sectionsFromStep.firstOrNull?.names
                        ?.getDescriptionLabelTranslated(context),
                    expandIntoColumnOnRow: false,
                  ).padding(ref
                      .read(templateRenderInputProvider)
                      .defaultPaddingWidgets),
                  subtitle: CustomMainText(
                    sectionsFromStep.firstOrNull?.descriptions
                        ?.getDescriptionLabelTranslated(context),
                    expandIntoColumnOnRow: false,
                  ).padding(ref
                      .read(templateRenderInputProvider)
                      .defaultPaddingWidgets),
                );
              }).toList() ??
              <Step>[const Step(content: SizedBox(), title: SizedBox())],
        ).createMargin(
            ref.read(templateRenderInputProvider).defaultMarginWidgets);
      },
    );
  }
}
