import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/flutter_templating.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../custom_main_text.dart';

class BoolSwitchInputWidget extends StatelessWidget {
  const BoolSwitchInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<bool> control;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IgnorePointer(
          ignoring: section.readonly == true,
          child: ReactiveSwitch(
            formControl: control,
          ),
        ),
        Consumer(builder: (ctx, ref, _) {
          return ref.read(templateRenderInputProvider).defaultGapRow;
        }),
        CustomMainText(section.names?.getDescriptionLabelTranslated(context)),
      ],
    );
  }
}
