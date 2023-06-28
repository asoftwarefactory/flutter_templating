import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../../../flutter_templating.dart';
import '../../core/providers/providers.dart';
import '../managers/enable_if_rule.dart';
import 'inputs/validators/manager.dart';
import 'template_stepper_widget.dart';
import 'title_description_widget.dart';

class CoreTemplateRenderWidget extends StatelessWidget {
  const CoreTemplateRenderWidget({
    Key? key,
    required this.templateRenderInput,
  }) : super(key: key);

  final TemplateRenderInput templateRenderInput;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        templateRenderInputProvider.overrideWith((ref) => templateRenderInput)
      ],
      child: TemplateContainerWidget(template: templateRenderInput.template),
    );
  }
}

class TemplateContainerWidget extends ConsumerStatefulWidget {
  final Template template;
  const TemplateContainerWidget({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  createState() => _TemplateContainerWidgetState();
}

class _TemplateContainerWidgetState
    extends ConsumerState<TemplateContainerWidget> {
  final _manager = EnableIfRuleManager();
  late final mainForm = ref.read(mainFormProvider);
  @override
  void initState() {
    _manager.initializeEnableIfRule(
        context, widget.template.enabledIfRules, mainForm);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _manager.dispose();
  }

  @override
  Widget build(context) {
    return ReactiveFormBuilder(
      form: () => mainForm,
      builder: (context, outputForm, _) => ReactiveFormConfig(
        validationMessages: ValidatorsManager.defaultValidationMessages,
        child: Consumer(builder: (context, ref, _) {
          return Card(
            child: Column(
              children: [
                TitleDescriptionWidget(
                  title: widget.template.names
                          ?.getDescriptionLabelTranslated(context) ??
                      '',
                  description: widget.template.descriptions
                      ?.getDescriptionLabelTranslated(context),
                ),
                TemplateStepperWidget(
                  template: widget.template,
                  mainForm: ref.read(mainFormProvider),
                ).expandIntoColumnOrRow(),
              ],
            ),
          ).createMargin(
              ref.read(templateRenderInputProvider).defaultMarginWidgets);
        }),
      ),
    );
  }
}
