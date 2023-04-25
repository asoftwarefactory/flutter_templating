import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../../../flutter_templating.dart';
import '../models/template_render_input.dart';
import '../utils/app_sizes.dart';
import 'template_stepper_widget.dart';
import 'title_description_widget.dart';

class CoreTemplateRenderWidget extends StatelessWidget {
  const CoreTemplateRenderWidget({
    Key? key,
    required this.template,
    this.templateRenderInput = const TemplateRenderInput(),
  }) : super(key: key);
  final Template template;
  final TemplateRenderInput templateRenderInput;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: Consumer(builder: (context, ref, _) {
      ref.read(templateRenderInputProvider.notifier).state =
          templateRenderInput;
      return TemplateContainerWidget(template: template);
    }));
  }
}

class TemplateContainerWidget extends StatelessWidget {
  final Template template;
  const TemplateContainerWidget({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final formGroup = FormGroup({});
    return ReactiveForm(
      formGroup: formGroup,
      child: Card(
        child: Column(
          children: [
            TitleDescriptionWidget(
              title:
                  template.names!.getDescriptionLabelTranslated(context) ?? '',
              description:
                  template.descriptions!.getDescriptionLabelTranslated(context),
            ),
            TemplateStepperWidget(
              formGroupTemplate: formGroup,
              template: template,
            ).expandIntoColumnOrRow(),
          ],
        ),
      ).createMargin(const EdgeInsets.all(Sizes.p4)),
    );
  }
}

final templateRenderInputProvider = StateProvider.autoDispose((ref) {
  return const TemplateRenderInput();
});
