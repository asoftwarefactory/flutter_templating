import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/core/providers/providers.dart';
import '../../core/http_client/http_client.dart';
import '../models/dataprovider_model.dart';
import '../models/template.dart';

class DataProviderManagerWidget extends ConsumerWidget {
  final Widget Function(
    BuildContext context,
    TemplateDataProvider? currentDataProvider,
    TemplateRenderPut? currentRenderPut,
    Section section,
    dynamic data,
  ) builder;
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
            .watch(
                _dataProviderGet(dataProviderWithTemplate!.dataProviderName!))
            .when(
              data: (data) => builder.call(
                  context, dataProviderWithTemplate, output, section, data),
              error: (err, stacktrace) => const SizedBox(),
              loading: () => const CircularProgressIndicator(),
            );
      } else {
        return builder.call(context, null, null, section, null);
      }
    } else {
      return builder.call(context, null, null, section, null);
    }
  }
}

final _dataProviderGet =
    FutureProvider.family<dynamic, String>((ref, dataProviderName) async {
  final dataProviders = ref.watch(dataprovidersProvider);
  final a = dataProviders.when(
    data: (data) => data,
    error: (err, stacktrace) => <DataproviderModel>[],
    loading: () => <DataproviderModel>[],
  );

  if (a.isNotEmpty) {
    final findedDataProvider = a.firstWhereOrNull(
        (dataProvider) => dataProvider.name == dataProviderName);
    if (findedDataProvider != null) {
      final url = findedDataProvider.backofficeUrl;
      if (url != null) {
        final input = ref.read(templateRenderInputProvider);
        final dataproviderUrl = input.urlOutput?.call(input.apiBaseUrl, url);
        if (dataproviderUrl != null) {
          // inputs ????
          final client = ref.read(httpClient);
          final b = await client.get(dataproviderUrl);
          return b.data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
});
