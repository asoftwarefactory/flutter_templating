import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/abstract_control.dart';
import 'package:flutter_templating/src/common/extensions/section.dart';
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
    if (section.hidden == true) {
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
            final adaptedSection = adapteSectionWithDataProvider(ref, res);
            return SectionGroupWidget(section: adaptedSection, form: mainForm)
                .createMargin(
                    ref.read(templateRenderInputProvider).defaultMarginWidgets);
          });
    } else if (section.type == SectionType.FIELD) {
      return DataProviderManagerWidget(
          section: section,
          builder: (ctx, res) {
            final adaptedSection = adapteSectionWithDataProvider(ref, res);
            return SectionFieldWidget(section: adaptedSection, form: mainForm)
                .createMargin(
                    ref.read(templateRenderInputProvider).defaultMarginWidgets);
          });
    } else {
      return const SizedBox();
    }
  }
}

Section adapteSectionWithDataProvider(WidgetRef ref, DPManagerWidgetRes res) {
  switch (res.currentDataProvider?.type) {
    /* case DataProviderTypes.FillGroup:
      if (res.section.type == SectionType.GROUP) {
        if (res.section.multiple == true) {
          final mainForm = ref.read(mainFormProvider);
          if (res.currentDataProvider?.sectionChildId != null) {
            final childControl = ExtAbstractControl.controlNested(
                res.currentDataProvider!.sectionChildId!, mainForm);
            if (childControl != null && childControl is FormArray) {
              // ? childControl.value = [];
              final values = <Map<String, dynamic>>[];
              if (res.resultData != null) {
                /*  for (final dataProviderData
                    in res.resultData as List<Map<String, dynamic>>) {
                  if (res.currentRenderPut?.fieldId != null &&
                      res.currentRenderPut!.dataProviderFieldName != null) {
                    values.add({
                      res.currentRenderPut!.fieldId!: dataProviderData[
                          res.currentRenderPut!.dataProviderFieldName]
                    });
                  }
                } */
              }
              values.isNotEmpty ? childControl.value = values : () {};
            } else {}
          } else {}
        } else {
          final mainForm = ref.read(mainFormProvider);
          if (res.currentDataProvider?.sectionChildId != null) {
            final childControl = ExtAbstractControl.controlNested(
                res.currentDataProvider!.sectionChildId!, mainForm);
            if (childControl != null && childControl is FormGroup) {
              // ? childControl.value = [];
              final values = <String, dynamic>{};
              if (res.resultData != null) {
                /* for (final dataProviderData
                    in res.resultData as List<Map<String, dynamic>>) {
                  if (res.currentRenderPut?.fieldId != null &&
                      res.currentRenderPut!.dataProviderFieldName != null) {
                    values.addAll({
                      res.currentRenderPut!.fieldId!: dataProviderData[
                          res.currentRenderPut!.dataProviderFieldName]
                    });
                  }
                } */
              }

              values.isNotEmpty ? childControl.value = values : () {};
            } else {}
          } else {}
        }
      } else {}
      return res.section.copyWith(); */

    case DataProviderTypes.FillGroup:
      final mainForm = ref.read(mainFormProvider);
      final outputs = (res.currentDataProvider?.outputs ?? []);
      for (final dataProviderOutput in outputs) {
        final childControl = ExtAbstractControl.controlNested(
          dataProviderOutput.fieldId,
          mainForm,
        );
        if (childControl != null) {
          if (res.resultData is List && dataProviderOutput.dataProviderFieldName != null) {
            for (final section in res.section.children) {
              if (section.id == dataProviderOutput.fieldId) {
                final resultDataList = res.resultData as List;
                // final resultDataMap = resultDataList.
                /* TODO check if this part must be there ? if (section.isField) {
                  if (section.isArray == true) {
                    final finalData = resultDataList.map(
                        (e) => e[dataProviderOutput.dataProviderFieldName]);
                    childControl.value = finalData;
                  }
                } else  */
                if (section.isFieldGroup) {
                  if (section.multiple == true) {
                    final finalData = resultDataList
                        .map((e) => {
                              dataProviderOutput.fieldId:
                                  e[dataProviderOutput.dataProviderFieldName]
                            })
                        .toList();

                    childControl.value = finalData;
                  }
                }

                /* for (final resultDataItem in resultDataList) {
                  debugPrint(resultDataItem.toString());
                } */

                /* if (res.resultData is Map) {
                  final newSection = addItemsIntoSectionFromDynamicMap(
                      section, res.resultData);
                  if (newSection.items?.isNotEmpty ?? false) {
                    section.items?.clear();
                    section.items?.addAll(newSection.items!);
                  }
                } */
              }
            }

            // ? childControl.value = res.resultData[dataProviderOutput.dataProviderFieldName];
          }
        }
      }

      return res.section;

    case DataProviderTypes.Items:
      final outputs = (res.currentDataProvider?.outputs ?? []);

      for (final dataProviderOutput in outputs) {
        for (final section in res.section.children) {
          if (section.id == dataProviderOutput.fieldId) {
            if (res.resultData is Map) {
              final newSection =
                  addItemsIntoSectionFromDynamicMap(section, res.resultData);
              if (newSection.items?.isNotEmpty ?? false) {
                section.items?.clear();
                section.items?.addAll(newSection.items!);
              }
            }
          }
        }
      }

      return res.section;

    case DataProviderTypes.Simple:
      final mainForm = ref.read(mainFormProvider);
      final outputs = (res.currentDataProvider?.outputs ?? []);
      for (final dataProviderOutput in outputs) {
        final childControl = ExtAbstractControl.controlNested(
          dataProviderOutput.fieldId,
          mainForm,
        );
        if (childControl != null) {
          if (res.resultData is Map &&
              dataProviderOutput.dataProviderFieldName != null) {
            childControl.value =
                res.resultData[dataProviderOutput.dataProviderFieldName];
          }
        }
      }

      return res.section;
    default:
      return res.section;
  }
}

Section addItemsIntoSectionFromDynamicMap(Section inputSection, Map map) {
  final items = <Item>[];
  (map).forEach((key, value) {
    switch (inputSection.fieldType) {
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
  return inputSection.copyWith(items: items);
}
