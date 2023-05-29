import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/providers/providers.dart';
import 'dataprovider_manager_widget.dart';
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

  Widget _buildField(BuildContext ctx, WidgetRef ref) {
    if (section.type == SectionType.GROUP) {
      return DataProviderManagerWidget(
          section: section,
          builder: (ctx, res) {
            final adaptedSection = adapteSectionWithDataProvider(res);
            return SectionGroupWidget(section: adaptedSection, form: mainForm)
                .createMargin(
                    ref.read(templateRenderInputProvider).defaultMarginWidgets);
          });
    } else if (section.type == SectionType.FIELD) {
      return DataProviderManagerWidget(
          section: section,
          builder: (ctx, res) {
            final adaptedSection = adapteSectionWithDataProvider(res);
            return SectionFieldWidget(section: adaptedSection, form: mainForm)
                .createMargin(
                    ref.read(templateRenderInputProvider).defaultMarginWidgets);
          });
    } else {
      return const SizedBox();
    }
  }
}

Section adapteSectionWithDataProvider(DPManagerWidgetRes res) {
  switch (res.currentDataProvider?.type) {
    case DataProviderTypes.FillGroup:
      debugPrint(
          "DataProvider path ${res.verticalDataProvider?.backofficeUrl}, Type ${res.currentDataProvider?.type?.name}, result  => ${res.resultData}");

      return res.section;
    case DataProviderTypes.Items:
      debugPrint(
          "DataProvider path ${res.verticalDataProvider?.backofficeUrl}, Type ${res.currentDataProvider?.type?.name}, result  => ${res.resultData}");
      /*  {
        "1": "Protettivo di VIALE ALDO MORO 10 - 20",
        "2": "Protettivo di VIALE ALDO MORO 10 - 20",
        "3": "Protettivo di VIALE ALDO MORO 10 - 20",
        "4": "Protettivo di VIALE ALDO MORO 10 - 20",
        "5": "Protettivo di VIALE ALDO MORO 10 - 20",
        "6": "Protettivo di VIALE ALDO MORO 10 - 20",
        "7": "Protettivo di MURA DI PORTA SAN FELICE 1 - 1",
        "8": "Protettivo di GALLERIA CAMILLO CAVOUR 1 - 1/V",
        "10": "Protettivo di VIA 21 APRILE 1945 5/9 - 20"
      } */

      if (res.resultData is Map &&
          res.section.fieldType ==
              res.verticalDataProvider?.outputs?.first.type) {
        final items = <Item>[];
        (res.resultData as Map).forEach((key, value) {
          if (res.section.fieldType == FieldTypes.Integer) {
            items.add(Item(key: int.parse(key), label: value.toString()));
          }else{
          items.add(Item(key: (key), label: value.toString()));

          }
        });
        return res.section.copyWith(items: items);
      }

      return res.section;
    case DataProviderTypes.Simple:
      debugPrint(
          "DataProvider path ${res.verticalDataProvider?.backofficeUrl}, Type ${res.currentDataProvider?.type?.name}, result  => ${res.resultData}");

      return res.section;
    default:
      return res.section;
  }
}
