import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'build_array_field.dart';
import 'build_autocomplete.dart';
import 'build_field.dart';
import 'build_multiple_select_field.dart';
import 'build_select_field.dart';
import 'inputs/validators/manager.dart';

class SectionFieldWidget extends ConsumerWidget {
  final Section section;
  final FormGroup form;
  const SectionFieldWidget({
    super.key,
    required this.section,
    required this.form,
  });
  dynamic get _defaultValue {
    dynamic value = section.defaultValue;
    return value;
  }

  @override
  Widget build(context, ref) {
    if (section.id == null) {
      return const SizedBox();
    }

    return ReactiveFormConfig(
      validationMessages: ValidatorsManager.defaultValidationMessages,
      child: _initializeField(context),
    );
  }

  Widget _initializeField(BuildContext context) {
    final items = section.items ?? [];
    final isArray = section.isArray ?? false;
    final isAutocomplete = section.autocomplete != null &&
        (section.autocomplete?.name != null ||
            (section.autocomplete!.inputs ?? []).isNotEmpty);

    if (isAutocomplete) {
      return BuildAutocomplete(
        defaultValue: _defaultValue,
        section: section,
        form: form,
      );
    } else if (items.isEmpty && !isArray) {
      return BuildField(
        defaultValue: _defaultValue,
        section: section,
        form: form,
      );
    } else if (items.isEmpty && isArray) {
      return BuildArrayField(
        defaultValue: _defaultValue,
        section: section,
        form: form,
      );
    } else if (items.isNotEmpty && !isArray) {
      return BuildSelectField(
        defaultValue: _defaultValue,
        section: section,
        form: form,
      );
    } else if (items.isNotEmpty && isArray) {
      return BuildMultipleSelectField(
        defaultValue: _defaultValue,
        section: section,
        form: form,
      );
    } else {
      return const SizedBox();
    }
  }
}
