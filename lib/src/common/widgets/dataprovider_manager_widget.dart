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

  Widget _defaultBuilder(BuildContext context, Section section) {
    return builder.call(context, DPManagerWidgetRes(section: section));
  }

  @override
  Widget build(context, ref) {
    final currentSectionId = section.id;
    if (currentSectionId == null || currentSectionId.isEmpty) {
      return _defaultBuilder(context, section);
    }
    final mainTemplate = ref.read(templateRenderInputProvider).template;
    final templateDataProviders =
        mainTemplate.dataProviders ?? <TemplateDataProvider>[];

    final dataProviderAttached = templateDataProviders.any(
        (templateDataProvider) =>
            templateDataProvider.sectionChildId != null &&
            templateDataProvider.sectionChildId == currentSectionId);
    if (dataProviderAttached) {
      final templateDataProvider = templateDataProviders.firstWhere(
          (templateDataProvider) =>
              templateDataProvider.sectionChildId != null &&
              templateDataProvider.sectionChildId == currentSectionId);
      return ref.watch(dataProviderGetProvider(templateDataProvider)).when(
            data: (verticalDataProviderResult) => builder.call(
              context,
              DPManagerWidgetRes(
                verticalDataProvider:
                    verticalDataProviderResult.verticalDataProvider,
                currentDataProvider: templateDataProvider,
                // currentRenderPut: output,
                section: section,
                dataProviderFounded:
                    verticalDataProviderResult.dataProviderFounded,
                resultData: verticalDataProviderResult.resultData,
              ),
            ),
            error: (err, stacktrace) => const SizedBox(),
            loading: () => const CircularProgressIndicator(),
          );
    }

    return _defaultBuilder(context, section);
  }

  /* @override
  Widget build(context, ref) {
    final template = ref.read(templateRenderInputProvider).template;
    final sectionAsDataProviderAttached = template.dataProviders?.any((dp) =>
            (dp.sectionChildId == section.id) ||
            (dp.outputs?.any((output) =>
                    section.id != null && output.fieldId == section.id!) ??
                false)) ??
        false;

    if (sectionAsDataProviderAttached) {
      final dataProviderWithTemplate = template.dataProviders?.firstWhereOrNull(
          (dataProviderTemplate) =>
              (dataProviderTemplate.sectionChildId == section.id) ||
              (dataProviderTemplate.outputs
                      ?.any((output) => output.fieldId == section.id) ??
                  false));
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
                  resultData: data.resultData,
                ),
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
            section: section,
          ),
        );
      }
    } else {
      return builder.call(context, DPManagerWidgetRes(section: section));
    }
  } */
}

@Riverpod(keepAlive: true)
class DataProviderGet extends _$DataProviderGet {
  @override
  Future<DataProviderResult> build(TemplateDataProvider dataProvider) async {
    return ref.watch(dataprovidersProvider).when(
          data: (allVerticalDataProviders)async  {
            
             if (allVerticalDataProviders.isNotEmpty) {
      final findedDataProvider = allVerticalDataProviders.firstWhereOrNull((verticalDataProvider) =>
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
