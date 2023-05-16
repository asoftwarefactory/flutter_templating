import 'package:flutter/material.dart';
import 'package:flutter_templating/src/common/extensions/list_description.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_raw_autocomplete/reactive_raw_autocomplete.dart';
import '../../models/template.dart';
import 'input_field.dart';

class AutocompleteInputWidget<T, D extends Object> extends StatelessWidget
    implements InputField {
  final Section section;
  final FormControl<T> control;
  final Future<Iterable<D>> Function(TextEditingValue) optionsBuilder;
  final String Function(D)? displayStringForOption;
  const AutocompleteInputWidget({
    Key? key,
    required this.section,
    required this.control,
    required this.optionsBuilder,
    this.displayStringForOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveRawAutocomplete<T, D>(
      readOnly: section.readonly == true,
      formControl: control,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: section.names?.getDescriptionLabelTranslated(context),
        hintText: section.descriptions?.getDescriptionLabelTranslated(context),
      ),
      optionsBuilder: optionsBuilder,
      displayStringForOption:
          displayStringForOption ?? RawAutocomplete.defaultStringForOption,
      optionsViewBuilder: (ctx, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);
                  final label = (displayStringForOption ??
                          RawAutocomplete.defaultStringForOption)
                      .call(option);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(label),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

/* Future<List<Comment>> _fetchComments(
    {Map<String, dynamic>? queryParameters}) async {
  final client = Dio();

  return await client
      .get(
        "https://jsonplaceholder.typicode.com/comments",
        queryParameters: queryParameters,
      )
      .then((e) => commentsFromList(e.data));
}

List<Comment> commentsFromList(List data) =>
    List<Comment>.from((data).map((x) => Comment.fromJson(x)));

List<Comment> commentsFromJson(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentsToJson(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Comment copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) =>
      Comment(
        postId: postId ?? this.postId,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
      );

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
} */
