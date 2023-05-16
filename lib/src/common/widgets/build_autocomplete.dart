import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../models/base_autocomplete.dart';
import 'inputs/autocomplete_input_widget.dart';

class BuildAutocomplete extends ConsumerWidget {
  final dynamic defaultValue;
  final Section section;
  const BuildAutocomplete({
    super.key,
    this.defaultValue,
    required this.section,
  });

  BaseAutocomplete? autocompleteFromSection(
    List<BaseAutocomplete> autocompletes,
    Section inputSection,
  ) {
    return autocompletes.firstWhereOrNull(
      (autocomplete) {
        if (autocomplete.name != null &&
            inputSection.autocomplete?.name != null &&
            autocomplete.name!.isNotEmpty &&
            inputSection.autocomplete!.name!.isNotEmpty &&
            autocomplete.name?.toLowerCase() ==
                inputSection.autocomplete?.name?.toLowerCase()) {
          return true;
        } else {
          return false;
        }
      },
    );
  }

  @override
  Widget build(context, ref) {
    final asyncAutocompletes = ref.watch(autocompletesProvider);
    final form = ref.read(mainFormGroupProvider);
    return asyncAutocompletes.when(
      data: (autocompletes) {
        final currentAutocomplete =
            autocompleteFromSection(autocompletes, section);
        if (currentAutocomplete != null) {
          return _buildAutocompleteWidget(form, currentAutocomplete);
        } else {
          return const SizedBox();
        }
      },
      error: (Object error, StackTrace stackTrace) {
        return const SizedBox();
      },
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildAutocompleteWidget(
      FormGroup form, BaseAutocomplete autocomplete) {
    if (section.id == null) {
      return const SizedBox();
    }
    final isArray = section.isArray ?? false;

    final control = form.getOrSetAbstractControlAndSetValidators(section.id!,
        () => FormControl<String>(touched: true, value: defaultValue),
        validators: section.validators,
        isArray: isArray) as FormControl<String>;

    return AutocompleteInputWidget<String, String>(
      control: control,
      section: section,
      optionsBuilder: (text) async {
        return [];
      },
    );
  }
}
