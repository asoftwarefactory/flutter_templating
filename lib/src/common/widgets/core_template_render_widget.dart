import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import '../../../flutter_templating.dart';
import '../../core/http_client.dart';
import '../managers/enable_if_rule.dart';
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

  @override
  void initState() {
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
      form: () {
        final form = ref.read(mainFormGroupProvider);
        _manager.initializeEnableIfRule(context, widget.template.enabledIfRules,
            ref.read(mainFormGroupProvider));
        return form;
      },
      builder: (context, outputForm, _) => Consumer(builder: (context, ref, _) {
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
              ).expandIntoColumnOrRow(),
            ],
          ),
        ).createMargin(
            ref.read(templateRenderInputProvider).defaultMarginWidgets);
      }),
    );
  }
}

final templateRenderInputProvider =
    StateProvider.autoDispose<TemplateRenderInput>((ref) {
  return TemplateRenderInput(
    authorityId: '',
    apiBaseUrl: '',
    bearerAccessToken: '',
    template: Template(),
  );
});

final mainFormGroupProvider = Provider((ref) {
  final formGroup = FormGroup({});
  ref.onDispose(() {
    formGroup.dispose();
  });
  return formGroup;
});

final autocompletesProvider =
    FutureProvider.autoDispose<List<AutocompleteModel>>((ref) async {
  final client = ref.read(httpClient);
  return await client.get("autocompletes").then((e) {
    return autocompletesModelFromList(e.data);
    // return [];
  });
});
