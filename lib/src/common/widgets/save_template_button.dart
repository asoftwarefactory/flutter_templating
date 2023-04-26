import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'custom_main_text.dart';

class SaveTemplateButton extends ConsumerWidget {
  const SaveTemplateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(builder: (context) {
      final form = ReactiveForm.of(context);
      return ElevatedButton(
        onPressed: (form?.valid ?? false)
            ? () async {
                await ref
                    .read(templateRenderInputProvider)
                    .onTemplateFormSend
                    ?.call(form?.value);
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
