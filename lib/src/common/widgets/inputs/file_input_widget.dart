import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:uuid/uuid.dart';
import '../../models/template.dart';
import '../core_template_render_widget.dart';
import '../custom_main_text.dart';

class FileInputWidget extends StatelessWidget {
  const FileInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<MultiFile<String>> control;

  bool get _disableButtons {
    // readonly feature
    return section.readonly == true;
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFilePicker<String>(
      formControl: control,
      filePickerBuilder: (pickImage, files, onChange) {
        final items = [
          ...files.platformFiles
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  ListTile(
                    onTap: _disableButtons == false
                        ? () {
                            onChange(files.copyWith(
                                platformFiles:
                                    List<PlatformFile>.from(files.platformFiles)
                                      ..removeAt(key)));
                          }
                        : null,
                    leading: const Icon(Icons.delete),
                    title: _PlatformFileListItem(value).build(context),
                  ),
                ),
              )
              .values,
        ];
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  return items.elementAt(i);
                },
              ),
            ),
            Consumer(builder: (context, ref, _) {
              return ElevatedButton(
                onPressed: _disableButtons == true ? null : pickImage,
                child: CustomMainText(
                    ref.read(templateRenderInputProvider).buttonPickFileText),
              );
            }),
          ],
        ).sized(height: 200);
      },
      decoration: InputDecoration(
        labelText: section.names?.getDescriptionLabelTranslated(context) ?? '',
        border: const OutlineInputBorder(),
        helperText:
            section.descriptions?.getDescriptionLabelTranslated(context),
      ),
    );
  }
}

abstract class _ListItem {
  Widget build(BuildContext context);
}

class _PlatformFileListItem extends _ListItem {
  final PlatformFile platformFile;

  _PlatformFileListItem(this.platformFile);

  @override
  Widget build(context) {
    if (UniversalPlatform.isWeb) {
      final fileId = const Uuid().v1();
      return CustomMainText("WEB__${fileId}__FILE");
    }
    return CustomMainText(platformFile.path ?? '');
  }
}
