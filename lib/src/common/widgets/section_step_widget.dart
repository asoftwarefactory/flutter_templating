import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:flutter_templating/src/common/utils/app_sizes.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_templating/flutter_templating.dart';
import '../models/field.dart';
import 'section_field_widget.dart';

class SectionStepWidget extends StatelessWidget {
  const SectionStepWidget({
    super.key,
    required this.section,
    required this.formGroupTemplate,
  });
  final Section section;
  final FormGroup formGroupTemplate;
  @override
  Widget build(BuildContext context) {
    return _buildField(context);
  }

  Widget _buildField(BuildContext context) {
    if (section.type == Type.FIELD && section.fieldType != null) {
      return SectionFieldWidget(
        field: FieldModel(
          label: section.names?.getDescriptionLabelTranslated(context),
          type: section.fieldType!,
          formControl: FormControl(),
        ),
      ).createMargin(const EdgeInsets.all(Sizes.p4));
    } else if (section.type == Type.GROUP) {
      return Card(
        child: Column(
          children: [
            AutoSizeText(
              section.names?.getDescriptionLabelTranslated(context) ?? '',
              minFontSize: Sizes.p20,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ).row().padding(const EdgeInsets.all(Sizes.p4)),
            if (section.descriptions != null) gapH4,
            if (section.descriptions != null)
              AutoSizeText(
                section.descriptions?.getDescriptionLabelTranslated(context) ??
                    '',
                maxLines: 10,
                minFontSize: Sizes.p16,
                overflow: TextOverflow.ellipsis,
              ).row().padding(const EdgeInsets.all(Sizes.p4)),
            gapH4,
            ...section.children?.map((e) {
                  return SectionStepWidget(
                    formGroupTemplate: formGroupTemplate,
                    section: e,
                  );
                }).toList() ??
                [],
          ],
        ),
      ).createMargin(const EdgeInsets.all(Sizes.p4));
    } else {
      return const SizedBox();
    }
  }
}
