import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';
import '../core_template_render_widget.dart';
import '../custom_main_text.dart';
import 'input_field.dart';

class FileInputWidget extends StatefulWidget implements InputField {
  const FileInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<PlatformFile> control;

  @override
  State<FileInputWidget> createState() => _FileInputWidgetState();
}

class _FileInputWidgetState extends State<FileInputWidget> {
  bool get _readonly {
    // readonly feature
    return widget.section.readonly == true;
  }

  final _control = FormControl<MultiFile<String>>();

  late final StreamSubscription<MultiFile<String>?> _controlSubscritpion;

  @override
  void initState() {
    _controlSubscritpion = _control.valueChanges.listen((event) {
      final lastFile = event?.platformFiles.lastOrNull;
      if (lastFile != null) {
        widget.control.value = lastFile;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controlSubscritpion.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Opacity(
        opacity: _readonly ? 0.5 : 1,
        child: ReactiveFilePicker<String>(
          allowMultiple: false,
          formControl: _control,
          filePickerBuilder: (pickImage, files, onChange) {
            final PlatformFile? file = files.platformFiles.lastOrNull;
            return Column(
              children: [
                if (file != null)
                  ListTile(
                    onTap: _readonly == false
                        ? () {
                            onChange(
                                const MultiFile(files: [], platformFiles: []));
                          }
                        : null,
                    leading: const Icon(Icons.delete),
                    title: CustomMainText(
                      file.name,
                      expandIntoColumnOnRow: false,
                    ),
                  ),
                Consumer(builder: (context, ref, _) {
                  return ElevatedButton(
                    onPressed: _readonly == true
                        ? null
                        : () {
                            pickImage().then((e) {
                              final lastFile =
                                  _control.value?.platformFiles.lastOrNull;
                              if (lastFile != null) {
                                onChange(MultiFile(
                                    files: [], platformFiles: [lastFile]));
                              }
                            });
                          },
                    child: CustomMainText(
                      ref.read(templateRenderInputProvider).buttonPickFileText,
                      expandIntoColumnOnRow: false,
                    ),
                  );
                }),
              ],
            );
          },
          decoration: InputDecoration(
            labelText:
                widget.section.names?.getDescriptionLabelTranslated(context),
            border: const OutlineInputBorder(),
            helperText: widget.section.descriptions
                ?.getDescriptionLabelTranslated(context),
          ),
        ),
      );
    });
  }
}
