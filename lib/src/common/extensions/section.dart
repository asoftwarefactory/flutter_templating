import '../models/template.dart';

extension ExtSection on Section {
  Section getAndOrderChildrenByTypeField() {
    final apChildren = children ?? [];
    apChildren.sort((e1, e2) {
      if (e1.type == Type.GROUP && e2.type == Type.FIELD) {
        return 1;
      } else {
        return -1;
      }
    });
    return copyWith(children: apChildren);
  }
}
