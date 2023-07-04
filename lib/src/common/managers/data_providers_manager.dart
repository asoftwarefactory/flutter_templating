import 'package:collection/collection.dart';
import 'package:flutter_templating/src/common/extensions/section.dart';
import 'package:flutter_templating/src/core/providers/providers.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../flutter_templating.dart';
import '../../core/http_client/http_client.dart';
import '../extensions/abstract_control.dart';
import '../models/dataprovider_model.dart';
import '../utils/initialize_main_form_with_template.dart';
import '../widgets/inputs/validators/validators_manager.dart';
part 'data_providers_manager.g.dart';

typedef DataProviderImplementations = List<DataProviderImplementation>;

typedef Any = dynamic;

@Riverpod(keepAlive: true)
class DataProvidersManager extends _$DataProvidersManager {
  final _dataProvidersImplementations = <DataProviderImplementation>[];
  late final _templateRenderInput = ref.read(templateRenderInputProvider);
  late final _mainForm = ref.read(mainFormProvider);
  late final _client = ref.read(httpClient);
  @override
  Future<void> build() async {}

  void onFieldInitialize(Section section) async {
    if (_dataProvidersImplementations.any((e) => e.sectionId == section.id)) {
      // skip section
      return;
    }

    final currentSectionId = section.id;
    if (currentSectionId.isEmpty) {
      // skip section
      return;
    }

    final templateDataProviders =
        _templateRenderInput.template.dataProviders ?? <TemplateDataProvider>[];

    final dataProviderAttached = templateDataProviders.any(
        (templateDataProvider) =>
            templateDataProvider.sectionChildId != null &&
            templateDataProvider.sectionChildId == currentSectionId);
    if (dataProviderAttached) {
      final templateDataProvider = templateDataProviders.firstWhere(
          (templateDataProvider) =>
              templateDataProvider.sectionChildId != null &&
              templateDataProvider.sectionChildId == currentSectionId);
      final result = await _dataProviderLoad(templateDataProvider);
      final res = DPManagerWidgetRes(
        verticalDataProvider: result.verticalDataProvider,
        currentDataProvider: templateDataProvider,
        section: section,
        dataProviderFounded: result.dataProviderFounded,
        dataProviderPath: result.dataProviderPath,
        resultData: result.resultData,
      );

      _setFieldValue(res, () {
        if (res.dataProviderFounded) {
          _dataProvidersImplementations.add(
            DataProviderImplementation(
              res.resultData,
              section.id,
              res.dataProviderPath,
            ),
          );
        }
      });
    }
  }

  Future<List<DataproviderModel>> _loadDataProviders() async {
    return await _client.get("dataproviders").then((e) {
      return dataprovidersModelFromList(e.data);
    });
  }

  Future<DataProviderResult> _dataProviderLoad(
      TemplateDataProvider dataProvider) async {
    final allVerticalDataProviders = await _loadDataProviders();
    if (allVerticalDataProviders.isNotEmpty) {
      final findedDataProvider = allVerticalDataProviders.firstWhereOrNull(
          (verticalDataProvider) =>
              verticalDataProvider.name != null &&
              dataProvider.dataProviderName != null &&
              verticalDataProvider.name == dataProvider.dataProviderName);
      if (findedDataProvider != null) {
        final url = findedDataProvider.backofficeUrl;
        if (url != null) {
          final queryParameters = <String, dynamic>{};
          for (final input in dataProvider.inputs ?? <TemplateRenderPut>[]) {
            if (input.dataProviderFieldName != null) {
              final referencedControl =
                  ExtAbstractControl.controlNested(input.fieldId, _mainForm);
              if (referencedControl != null &&
                  referencedControl.value != null &&
                  referencedControl.value.toString().isNotEmpty) {
                queryParameters.addAll({
                  input.dataProviderFieldName!:
                      referencedControl.value.toString(),
                });
              }
            }
          }
          final dataproviderUrl = _templateRenderInput.urlOutput
                  ?.call(_templateRenderInput.apiBaseUrl, url) ??
              '${_templateRenderInput.apiBaseUrl}$url'
                  .replaceAll("/v1//v1/", "/v1/")
                  .replaceAll("/v1/v1/", "/v1/");
          final b = await _client.get(dataproviderUrl,
              queryParameters: queryParameters);
          return DataProviderResult(
            resultData: b.data,
            dataProviderFounded: true,
            dataProviderPath: dataproviderUrl,
            verticalDataProvider: findedDataProvider,
          );
        }
      }
    }
    return DataProviderResult(dataProviderPath: "");
  }

  void _setFieldValue(DPManagerWidgetRes res, void Function() onSet) {
    switch (res.currentDataProvider?.type) {
      case DataProviderTypes.FillGroup:
        if (res.currentDataProvider?.sectionChildId != null) {
          final parentControl = ExtAbstractControl.controlNested(
            res.currentDataProvider!.sectionChildId!,
            _mainForm,
          );
          if (res.section.isMultiple && res.section.isFieldGroup) {
            final formArray = parentControl as FormArray?;
            if (formArray != null) {
              if (res.resultData is List) {
                for (final dpOutput in res.currentDataProvider?.outputs ??
                    <TemplateRenderPut>[]) {
                  for (final result in res.resultData as List) {
                    final control = createControlWithSectionField(res
                        .section.children.first); // TODO : remove first element
                    ValidatorsManager.initializeValidators(
                      control,
                      res.section.children.first.validators ?? [],
                      res.section.children.first.isArray ?? false,
                    );
                    control.updateValue(result[dpOutput.dataProviderFieldName]);
                    final group = FormGroup({dpOutput.fieldId: control});
                    ValidatorsManager.initializeValidators(
                      group,
                      res.section.validators ?? [],
                      res.section.isArray ?? false,
                    );
                    formArray.add(group);
                  }
                }
              }
              onSet.call();
            }
          }

          /* final outputs = (res.currentDataProvider?.outputs ?? []);
        for (final dataProviderOutput in outputs) {
          final childControl = ExtAbstractControl.controlNested(
            dataProviderOutput.fieldId,
            mainForm,
          );
          if (childControl != null) {
            if (res.resultData is List &&
                dataProviderOutput.dataProviderFieldName != null) {
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
                  } else if (section.isField) {}

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
        } */
        }

      case DataProviderTypes.Items:
        final outputs = (res.currentDataProvider?.outputs ?? []);

        for (final dataProviderOutput in outputs) {
          for (final section in res.section.children) {
            if (section.id == dataProviderOutput.fieldId) {
              if (res.resultData is Map) {
                final items = _getDropdownItemsFromDataProvider(
                    section.fieldType, res.resultData);
                ref.read(itemsStateProvider.notifier).set(section.id, items);
                onSet.call();
              }
            }
          }
        }

      case DataProviderTypes.Simple:
        final outputs = (res.currentDataProvider?.outputs ?? []);
        for (final dataProviderOutput in outputs) {
          final childControl = ExtAbstractControl.controlNested(
            dataProviderOutput.fieldId,
            _mainForm,
          );
          if (childControl != null) {
            if (res.resultData is Map &&
                dataProviderOutput.dataProviderFieldName != null) {
              childControl.value =
                  res.resultData[dataProviderOutput.dataProviderFieldName];
              onSet.call();
            }
          }
        }

      default:
    }
  }

  Items _getDropdownItemsFromDataProvider(FieldTypes? type, Map map) {
    final items = <Item>[];
    (map).forEach((key, value) {
      switch (type) {
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
          items.add(Item(key: (key), label: value.toString()));
      }
    });
    return items;
  }
}

class DataProviderResult {
  final DataproviderModel? verticalDataProvider;
  final dynamic resultData;
  final bool dataProviderFounded;
  final String dataProviderPath;
  DataProviderResult({
    this.verticalDataProvider,
    this.resultData,
    this.dataProviderFounded = false,
    required this.dataProviderPath,
  });
}

/// DataProviderManagerWidget widget builder model
class DPManagerWidgetRes extends DataProviderResult {
  final Section section;
  // final TemplateRenderPut? currentRenderPut;
  final TemplateDataProvider? currentDataProvider;

  DPManagerWidgetRes({
    super.resultData,
    super.verticalDataProvider,
    super.dataProviderFounded,
    // this.currentRenderPut,
    required this.section,
    this.currentDataProvider,
    required super.dataProviderPath,
  });
}

class DataProviderImplementation {
  final dynamic data;
  final String sectionId;
  final String dataProviderPath;

  DataProviderImplementation(this.data, this.sectionId, this.dataProviderPath);
}
