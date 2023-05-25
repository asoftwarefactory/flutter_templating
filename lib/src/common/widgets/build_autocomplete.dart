import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/section.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/http_client/http_client.dart';
import '../../core/providers/providers.dart';
import '../extensions/abstract_control.dart';
import '../mixins/enable_if_rule_mixin.dart';
import '../utils/field_is_searchable.dart';
import 'inputs/autocomplete_input_widget.dart';

class BuildAutocomplete extends ConsumerWidget with EnableIfRuleMixin {
  final dynamic defaultValue;
  final Section section;
  final FormGroup form;
  const BuildAutocomplete({
    super.key,
    this.defaultValue,
    required this.section,
    required this.form,
  });

  @override
  Widget build(context, ref) {
    final asyncAutocompletes = ref.watch(autocompletesProvider);
    final field = asyncAutocompletes.when(
      data: (autocompletes) {
        final currentAutocomplete =
            section.filterAutocompleteBySectionField(autocompletes);
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
    super.initializeField(form, ref.read(templateRenderInputProvider).template,
        fieldId: section.id);
    return field;
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
          return await _autocompleteLoader(text, completeAutocomplete, ref);
        } else {
          return [];
        }
      },
    );
  }

  Future<List<Item>> _autocompleteLoader(
    TextEditingValue value,
    AutocompleteModel completeAutocomplete,
    WidgetRef ref,
  ) async {
    final client = ref.read(httpClient);
    final queryParameters = <String, String>{};
    queryParameters.addAll({"searchText": value.text});
    for (final input in section.autocomplete?.inputs ??
        <TemplateAutocompleteFieldMapping>[]) {
      final inputIsSerchable = input.autocompleteFieldName != null &&
          input.fieldId != null &&
          fieldIsSearchable(
              ref.read(templateRenderInputProvider).template, input.fieldId!);
      if (inputIsSerchable) {
        final key = input.autocompleteFieldName!;
        final mainForm = ref.read(mainFormProvider);
        final controlWithAutocompleteInputs =
            ExtAbstractControl.controlNested(input.fieldId!, mainForm);
        if (controlWithAutocompleteInputs != null) {
          final data = controlWithAutocompleteInputs.value;
          if (data != null && data.toString().isNotEmpty) {
            queryParameters.addAll({key: data.toString()});
          }
        }
      } else {
        // autocomplete input cannot be searched
      }
    }

    if (completeAutocomplete.backofficeUrl != null &&
        completeAutocomplete.backofficeUrl!.isNotEmpty) {
      final urlOutputAutocomplete = ref
              .read(templateRenderInputProvider)
              .urlOutput
              ?.call(client.options.baseUrl,
                  completeAutocomplete.backofficeUrl!) ??
          '${client.options.baseUrl}${completeAutocomplete.backofficeUrl!}'
              .replaceAll("/v1//v1/", "/v1/")
              .replaceAll("/v1/v1/", "/v1/");
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
