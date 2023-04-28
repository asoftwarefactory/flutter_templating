import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:flutter_templating/src/common/extensions/widget.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../models/template.dart';
import '../core_template_render_widget.dart';
import '../custom_main_text.dart';

class FilesInputWidget extends StatelessWidget {
  const FilesInputWidget({
    Key? key,
    required this.section,
    required this.control,
  }) : super(key: key);
  final Section section;
  final FormControl<MultiFile<String>> control;

  bool get _readonly {
    // readonly feature
    return section.readonly == true;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Opacity(
        opacity: _readonly ? 0.5 : 1,
        child: ReactiveFilePicker<String>(
          allowMultiple: true,
          formControl: control,
          filePickerBuilder: (pickImage, files, onChange) {
            final items = [
              ...files.platformFiles
                  .asMap()
                  .map(
                    (key, value) => MapEntry(
                      key,
                      ListTile(
                        onTap: _readonly == false
                            ? () {
                                onChange(files.copyWith(
                                    platformFiles: List<PlatformFile>.from(
                                        files.platformFiles)
                                      ..removeAt(key)));
                              }
                            : null,
                        leading: const Icon(Icons.delete),
                        title: CustomMainText(
                          value.name,
                          expandIntoColumnOnRow: false,
                        ),
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
                    onPressed: _readonly == true ? null : pickImage,
                    child: CustomMainText(
                      ref.read(templateRenderInputProvider).buttonPickFileText,
                      expandIntoColumnOnRow: false,
                    ),
                  );
                }),
              ],
            ).sized(height: 200);
          },
          decoration: InputDecoration(
            labelText:
                section.names?.getDescriptionLabelTranslated(context) ?? '',
            border: const OutlineInputBorder(),
            helperText:
                section.descriptions?.getDescriptionLabelTranslated(context),
          ),
        ),
      );
    });
  }
}
