import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
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
      return res.section;
    case DataProviderTypes.Items:
      if (res.resultData is Map) {
        final items = <Item>[];
        (res.resultData as Map).forEach((key, value) {
          switch (res.section.fieldType) {
            case FieldTypes.String:
              items.add(Item(key: key.toString(), label: value.toString()));
            case FieldTypes.Integer:
              items.add(Item(key: int.parse(key), label: value.toString()));
            case FieldTypes.Decimal:
              items.add(Item(key: double.parse(key), label: value.toString()));
            case FieldTypes.Currency:
              items.add(Item(key: double.parse(key), label: value.toString()));
            case FieldTypes.Boolean:
              items.add(Item(key: bool.parse(key), label: value.toString()));
            case FieldTypes.DateUtc:
              items.add(Item(key: (key), label: value.toString()));
            case FieldTypes.DateNoUtc:
              items.add(Item(key: (key), label: value.toString()));
            case FieldTypes.DateTime:
              items.add(Item(key: (key), label: value.toString()));
            case FieldTypes.Time:
              items.add(Item(key: (key), label: value.toString()));
            case FieldTypes.File:
              items.add(Item(key: (key), label: value.toString()));
            default:
          }
        });
        return res.section.copyWith(items: items);
      } else {
        return res.section.copyWith();
      }
    case DataProviderTypes.Simple:
      return res.section.copyWith();
    default:
      return res.section.copyWith();
  }
}
