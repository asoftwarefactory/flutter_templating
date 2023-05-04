import 'package:uuid/uuid.dart';

class Unique<T> {
  late final String _id;
  final T value;

  Unique({
    required this.value,
  }) {
    _id = const Uuid().v1();
  }

  Unique<T> copyWith({
    T? data,
  }) {
    return Unique<T>(
      value: data ?? this.value,
    );
  }

  @override
  String toString() => 'Wrapper(data: $value, id: $_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Unique<T> && other.value == value && other._id == _id;
  }

  @override
  int get hashCode => value.hashCode + _id.hashCode;
}