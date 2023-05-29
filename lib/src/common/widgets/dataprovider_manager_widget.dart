import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/core/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/http_client/http_client.dart';
import '../extensions/abstract_control.dart';
import '../models/dataprovider_model.dart';
import '../models/template.dart';
part 'dataprovider_manager_widget.g.dart';

class DataProviderManagerWidget extends ConsumerWidget {
  final Widget Function(BuildContext context, DPManagerWidgetRes result)
      builder;
  final Section section;
  const DataProviderManagerWidget({
    super.key,
    required this.builder,
    required this.section,
  });

  @override
  Widget build(context, ref) {
    final template = ref.read(templateRenderInputProvider).template;
    final sectionAsDataProviderAttached = template.dataProviders?.any((dp) =>
            dp.outputs?.any((output) =>
                section.id != null && output.fieldId == section.id!) ??
            false) ??
        false;

    if (sectionAsDataProviderAttached) {
      final dataProviderWithTemplate = template.dataProviders?.firstWhereOrNull(
          (dataProviderTemplate) =>
              dataProviderTemplate.outputs
                  ?.any((output) => output.fieldId == section.id) ??
              false);
      final output = dataProviderWithTemplate?.outputs
          ?.firstWhereOrNull((out) => out.fieldId == section.id);
      final currentDataProviderName = output?.dataProviderFieldName;
      if (output != null &&
          currentDataProviderName != null &&
          dataProviderWithTemplate?.dataProviderName != null) {
        return ref
            .watch(dataProviderGetProvider(dataProviderWithTemplate!))
            .when(
              data: (data) => builder.call(
                context,
                DPManagerWidgetRes(
                    verticalDataProvider: data.verticalDataProvider,
                    currentDataProvider: dataProviderWithTemplate,
                    currentRenderPut: output,
                    section: section,
                    resultData: data.resultData),
              ),
              error: (err, stacktrace) => const SizedBox(),
              loading: () => const CircularProgressIndicator(),
            );
      } else {
        return builder.call(
            context,
            DPManagerWidgetRes(
                currentDataProvider: dataProviderWithTemplate,
                currentRenderPut: output,
                section: section));
      }
    } else {
      return builder.call(context, DPManagerWidgetRes(section: section));
    }
  }
}

@Riverpod(keepAlive: true)
class DataProviderGet extends _$DataProviderGet {
  @override
  Future<DataProviderResult> build(TemplateDataProvider dataProvider) async {
    final dataProviders = ref.watch(dataprovidersProvider);
    final a = dataProviders.when(
      data: (data) => data,
      error: (err, stacktrace) => <DataproviderModel>[],
      loading: () => <DataproviderModel>[],
    );

    if (a.isNotEmpty) {
      final findedDataProvider = a.firstWhereOrNull((verticalDataProvider) =>
          verticalDataProvider.name != null &&
          dataProvider.dataProviderName != null &&
          verticalDataProvider.name == dataProvider.dataProviderName);
      if (findedDataProvider != null) {
        final url = findedDataProvider.backofficeUrl;
        if (url != null) {
          final queryParameters = <String, dynamic>{};
          final mainForm = ref.read(mainFormProvider);
          for (final input in dataProvider.inputs ?? <TemplateRenderPut>[]) {
            if (input.fieldId != null && input.dataProviderFieldName != null) {
              final referencedControl =
                  ExtAbstractControl.controlNested(input.fieldId!, mainForm);
              if (referencedControl != null) {
                queryParameters.addAll({
                  input.dataProviderFieldName!:
                      referencedControl.value.toString(),
                });
              }
            }
          }
          final templateRenderInput = ref.read(templateRenderInputProvider);
          final dataproviderUrl = templateRenderInput.urlOutput
              ?.call(templateRenderInput.apiBaseUrl, url);
          if (dataproviderUrl != null) {
            final client = ref.read(httpClient);
            final b = await client.get(dataproviderUrl,
                queryParameters: queryParameters);
            return DataProviderResult(
                resultData: b.data, verticalDataProvider: findedDataProvider);
          }
        }
      }
    }
    return DataProviderResult();
  }
}

class DataProviderResult {
  final DataproviderModel? verticalDataProvider;
  final dynamic resultData;
  DataProviderResult({this.verticalDataProvider, this.resultData});
}

/// DataProviderManagerWidget widget builder model
class DPManagerWidgetRes extends DataProviderResult {
  final Section section;
  final TemplateRenderPut? currentRenderPut;
  final TemplateDataProvider? currentDataProvider;

  DPManagerWidgetRes({
    super.resultData,
    super.verticalDataProvider,
    this.currentRenderPut,
    required this.section,
    this.currentDataProvider,
  });
}
