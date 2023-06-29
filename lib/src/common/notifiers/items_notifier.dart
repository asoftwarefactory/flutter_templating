import '../models/template.dart';
import 'iterable_notifier.dart';

class ItemsNotifier extends IterableNotifier<Item> {
  ItemsNotifier({List<Item> state = const []}) : super(state: state);
}
