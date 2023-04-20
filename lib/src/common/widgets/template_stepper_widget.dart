import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:flutter_templating/src/common/utils/app_sizes.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/template_step.dart';
import 'package:flutter_templating/src/common/widgets/section_step_widget.dart';
import '../notifiers/indexed_notifier.dart';

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
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final index = ref.watch(templateStepperBuilderProvider);
        return Stepper(
          controlsBuilder: (ctx, details) {
            return Row(
              children: <Widget>[
                IconButton(
                  onPressed: details.onStepCancel,
                  icon: const Icon(Icons.arrow_upward_rounded),
                ),
                gapW12,
                IconButton(
                  icon: const Icon(Icons.arrow_downward_rounded),
                  onPressed: details.onStepContinue,
                ),
              ],
            ).createMargin(const EdgeInsets.symmetric(vertical: 0));
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
                        section: section,
                      );
                    }).toList(),
                  ),
                  title: AutoSizeText(
                    sectionsFromStep.firstOrNull?.names
                            ?.getDescriptionLabelTranslated(context) ??
                        "",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ).flexible().padding(const EdgeInsets.all(Sizes.p4)),
                  subtitle: AutoSizeText(
                    sectionsFromStep.firstOrNull?.descriptions
                            ?.getDescriptionLabelTranslated(context) ??
                        "",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ).flexible().padding(const EdgeInsets.all(Sizes.p4)),
                );
              }).toList() ??
              <Step>[],
        ).createMargin(const EdgeInsets.all(Sizes.p4));
      },
    );
  }
}
