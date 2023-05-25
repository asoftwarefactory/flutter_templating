import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataProviderWrapper extends StatelessWidget {
  final Widget Function(dynamic data) builder;
  const DataProviderWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {



    return const Placeholder();
  }
}



final dataProviderGet =FutureProvider.family<dynamic , String>((ref, dataProviderName) async =>"");