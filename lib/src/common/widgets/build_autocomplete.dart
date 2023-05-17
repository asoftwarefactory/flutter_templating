import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/section.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/base_http_client.dart';
import 'inputs/autocomplete_input_widget.dart';

class BuildAutocomplete extends ConsumerWidget {
  final dynamic defaultValue;
  final Section section;
  const BuildAutocomplete({
    super.key,
    this.defaultValue,
    required this.section,
  });

  @override
  Widget build(context, ref) {
    final asyncAutocompletes = ref.watch(autocompletesProvider);

    final form = ref.read(mainFormGroupProvider);
    return asyncAutocompletes.when(
      data: (autocompletes) {
        final currentAutocomplete = section.getAutocomplete(autocompletes);
        if (currentAutocomplete != null) {
          if (section.id == null || section.autocomplete == null) {
            return const SizedBox();
          }
          return _buildAutocompleteWidget(form, currentAutocomplete, ref);
        } else {
          return const SizedBox();
        }
      },
      error: (Object error, StackTrace stackTrace) => const SizedBox(),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildAutocompleteWidget(
    FormGroup form,
    AutocompleteModel completeAutocomplete,
    WidgetRef ref,
  ) {
    final isArray = section.isArray ?? false;
    final control = form.getOrSetAbstractControlAndSetValidators(
      section.id!,
      () => FormControl<Item>(touched: true, value: defaultValue),
      validators: section.validators,
      isArray: isArray,
    ) as FormControl<Item>;

    return AutocompleteInputWidget<Item, Item>(
      control: control,
      section: section,
      displayStringForOption: (value) => value.label ?? "",
      optionsBuilder: (text) async {
        if (text.text.length > 2) {
          return await _autocompleteLoader<int>(
              text, form, completeAutocomplete, ref);
        } else {
          return [];
        }
      },
    );
  }

  Future<List<Item>> _autocompleteLoader<T>(
    TextEditingValue value,
    FormGroup form,
    AutocompleteModel completeAutocomplete,
    WidgetRef ref,
  ) async {
    final client = ref.read(httpClient);
    final queryParameters = <String, String>{};
    queryParameters.addAll({"searchText": value.text});
    for (final input in section.autocomplete?.inputs ??
        <TemplateAutocompleteFieldMapping>[]) {
      if (input.autocompleteFieldName != null && input.fieldId != null) {
        final key = input.autocompleteFieldName!;
        if (form.contains(input.fieldId!)) {
          final data = form.control(input.fieldId!).value;
          if (data != null) {
            queryParameters.addAll({key: data.toString()});
          }
        }
      }
    }

    if (completeAutocomplete.backofficeUrl != null &&
        completeAutocomplete.backofficeUrl!.isNotEmpty) {
      final urlOutputAutocomplete = ref
              .read(templateRenderInputProvider)
              .urlOutputAutocomplete
              ?.call(client.options.baseUrl,
                  completeAutocomplete.backofficeUrl!) ??
          '${client.options.baseUrl}${completeAutocomplete.backofficeUrl!}';
      try {
        return await client
            .get(urlOutputAutocomplete, queryParameters: queryParameters)
            .then((re) {
          return List.from(re.data).map((e) => Item.fromJson(e)).toList();
        });

        // ignore: unused_catch_clause
      } on DioError catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }
}