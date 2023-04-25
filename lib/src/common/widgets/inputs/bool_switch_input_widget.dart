import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';
import '../../utils/app_sizes.dart';

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
        gapW12,
        AutoSizeText(
            section.names?.getDescriptionLabelTranslated(context) ?? ''),
      ],
    );
  }
}
