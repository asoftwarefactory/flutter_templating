/* import 'package:flutter_templating/src/core/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../flutter_templating.dart';
import '../models/dataprovider_model.dart';
part 'data_providers_manager.g.dart';

@Riverpod(keepAlive: true)
class DataProvidersManager extends _$DataProvidersManager {
  late final dataProviders = ref.watch(dataprovidersProvider);
  final dataProvidersImplementations = <DataProviderImplementation>[];
  late final template = ref.read(templateRenderInputProvider).template;
  late final mainForm = ref.read(mainFormProvider);
  @override
  Future<void> build() async {}

  void onFieldInitialize(Section section) {}

  /* void loadDataProviders() {
    // updateShouldNotify(state, state);
  } */

  // void initialize() {}
}

@Riverpod(keepAlive: true)
class DataProviderGet extends _$DataProviderGet {
  @override
  Future<DataProviderResult> build(TemplateDataProvider dataProvider) async {
    return ref.watch(dataprovidersProvider).when(
          data: (allVerticalDataProviders) async {
            if (allVerticalDataProviders.isNotEmpty) {
              final findedDataProvider = allVerticalDataProviders
                  .firstWhereOrNull((verticalDataProvider) =>
                      verticalDataProvider.name != null &&
                      dataProvider.dataProviderName != null &&
                      verticalDataProvider.name ==
                          dataProvider.dataProviderName);
              if (findedDataProvider != null) {
                final url = findedDataProvider.backofficeUrl;
                if (url != null) {
                  final queryParameters = <String, dynamic>{};
                  final mainForm = ref.read(mainFormProvider);
                  for (final input
                      in dataProvider.inputs ?? <TemplateRenderPut>[]) {
                    if (input.dataProviderFieldName != null) {
                      final referencedControl =
                          ExtAbstractControl.controlNested(
                              input.fieldId, mainForm);
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
                  final templateRenderInput =
                      ref.read(templateRenderInputProvider);
                  final dataproviderUrl = templateRenderInput.urlOutput
                      ?.call(templateRenderInput.apiBaseUrl, url);
                  if (dataproviderUrl != null) {
                    final client = ref.read(httpClient);
                    final b = await client.get(dataproviderUrl,
                        queryParameters: queryParameters);
                    return DataProviderResult(
                        resultData: b.data,
                        verticalDataProvider: findedDataProvider);
                  }
                }
              }
            }
            return DataProviderResult();
          },
          error: (err, stacktrace) => DataProviderResult(),
          loading: () => DataProviderResult(),
        );
  }
}

class DataProviderResult {
  final DataproviderModel? verticalDataProvider;
  final dynamic resultData;
  final bool dataProviderFounded;
  DataProviderResult({
    this.verticalDataProvider,
    this.resultData,
    this.dataProviderFounded = false,
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
  });
}

class DataProviderImplementation {
  final dynamic data;
  final String sectionId;
  final String dataProviderPath;

  DataProviderImplementation(this.data, this.sectionId, this.dataProviderPath);
}

typedef DataProviderImplementations = List<DataProviderImplementation>;
 */