import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core/providers/providers.dart';
import '../models/template.dart';
import 'custom_main_text.dart';

class SaveTemplateButton extends ConsumerWidget {
  const SaveTemplateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveFormConsumer(builder: (context, form, _) {
      return ElevatedButton(
        onPressed: (form.valid)
            ? () async {
                final debugLogEnabled =
                    ref.read(templateRenderInputProvider).enableDebugLog;
                if (debugLogEnabled) {
                  final a = json.encode(form.value, toEncodable: (e) {
                    // parse Item object
                    if (e is Item) {
                      return e.toJson()["key"];
                    } else {
                      return null;
                    }
                  });
                  log(a, name: "form data to save");
                }

                await ref
                    .read(templateRenderInputProvider)
                    .onTemplateFormSend
                    ?.call(form.value);
              }
            : null,
        child: CustomMainText(
          ref.read(templateRenderInputProvider).buttonSaveTemplateText,
          expandIntoColumnOnRow: false,
        ),
      ).createMargin(
          ref.read(templateRenderInputProvider).defaultMarginWidgets);
    });
  }
}
