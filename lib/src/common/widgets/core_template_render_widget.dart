import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../flutter_templating.dart';
import '../utils/app_sizes.dart';
import 'template_stepper_widget.dart';

class CoreTemplateRenderWidget extends StatelessWidget {
  const CoreTemplateRenderWidget({super.key, required this.template});
  final Template template;
  @override
  Widget build(BuildContext context) {
    if (FlutterTemplating.of(context) == null) {
      throw Exception("FlutterTemplating not initialized");
    }
    return TemplateContainerWidget(template: template);
  }
}

class TemplateContainerWidget extends StatelessWidget {
  final Template template;
  TemplateContainerWidget({Key? key, required this.template}) : super(key: key);

  late final _formGroup =
      FormGroupExt.createFormGroupFromTemplateJSON(template);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => _formGroup,
      builder: (ctx, form, _) => LayoutBuilder(builder: (context, constraints) {
        return Card(
          child: Column(
            children: [
              _buildTemplateTitle(context),
              TemplateStepperWidget(
                formGroupTemplate: form,
                template: template,
              ).expandIntoColumnOrRow(),
            ],
          ),
        ).createMargin(const EdgeInsets.all(Sizes.p4));
      }),
    );
  }

  Widget _buildTemplateTitle(BuildContext context) {
    return Column(children: [
      if (template.names != null)
        AutoSizeText(
          template.names!.getDescriptionLabelTranslated(context) ?? '',
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          minFontSize: Sizes.p20,
        ).flexible().row().padding(const EdgeInsets.all(Sizes.p4)),
      if (template.descriptions != null)
        AutoSizeText(
          template.descriptions!.getDescriptionLabelTranslated(context) ?? '',
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          minFontSize: Sizes.p16,
        ).flexible().row().padding(const EdgeInsets.all(Sizes.p4)),
    ]);
  }
}
