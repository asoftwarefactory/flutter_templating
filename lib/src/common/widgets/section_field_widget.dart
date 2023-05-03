import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'build_array_field.dart';
import 'build_field.dart';
import 'build_multiple_select_field.dart';
import 'build_select_field.dart';
import 'inputs/validators/manager.dart';

class SectionFieldWidget extends ConsumerStatefulWidget {
  final Section section;

  const SectionFieldWidget({
    super.key,
    required this.section,
  });

  @override
  createState() => _SectionFieldWidgetState();
}

class _SectionFieldWidgetState extends ConsumerState<SectionFieldWidget> {
  dynamic get _defaultValue {
    dynamic value = widget.section.defaultValue;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.section.id == null) {
      return const SizedBox();
    }
    return ReactiveFormConfig(
      validationMessages: ValidatorsManager.defaultValidationMessages,
      child: _initializeField(context),
    );
  }

  Widget _initializeField(BuildContext context) {
    final items = widget.section.items ?? [];
    final isArray = widget.section.isArray ?? false;

    if (items.isEmpty && !isArray) {
      return BuildField(
        defaultValue: _defaultValue,
        section: widget.section,
      );
    } else if (items.isEmpty && isArray) {
      return BuildArrayField(
        defaultValue: _defaultValue,
        section: widget.section,
      );
    } else if (items.isNotEmpty && !isArray) {
      return BuildSelectField(
        defaultValue: _defaultValue,
        section: widget.section,
      );
    } else if (items.isNotEmpty && isArray) {
      return BuildMultipleSelectField(
        defaultValue: _defaultValue,
        section: widget.section,
      );
    } else {
      return const SizedBox();
    }
  }
}
