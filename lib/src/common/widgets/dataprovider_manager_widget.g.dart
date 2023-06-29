// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataprovider_manager_widget.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataProviderGetHash() => r'8855595de57ead1550eb2321d4adee106103281a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DataProviderGet
    extends BuildlessAsyncNotifier<DataProviderResult> {
  late final TemplateDataProvider dataProvider;

  Future<DataProviderResult> build(
    TemplateDataProvider dataProvider,
  );
}

/// See also [DataProviderGet].
@ProviderFor(DataProviderGet)
const dataProviderGetProvider = DataProviderGetFamily();

/// See also [DataProviderGet].
class DataProviderGetFamily extends Family<AsyncValue<DataProviderResult>> {
  /// See also [DataProviderGet].
  const DataProviderGetFamily();

  /// See also [DataProviderGet].
  DataProviderGetProvider call(
    TemplateDataProvider dataProvider,
  ) {
    return DataProviderGetProvider(
      dataProvider,
    );
  }

  @override
  DataProviderGetProvider getProviderOverride(
    covariant DataProviderGetProvider provider,
  ) {
    return call(
      provider.dataProvider,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dataProviderGetProvider';
}

/// See also [DataProviderGet].
class DataProviderGetProvider
    // ignore: invalid_use_of_visible_for_testing_member
    extends AsyncNotifierProviderImpl<DataProviderGet, DataProviderResult> {
  /// See also [DataProviderGet].
  DataProviderGetProvider(
    this.dataProvider,
  ) : super.internal(
          () => DataProviderGet()..dataProvider = dataProvider,
          from: dataProviderGetProvider,
          name: r'dataProviderGetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dataProviderGetHash,
          dependencies: DataProviderGetFamily._dependencies,
          allTransitiveDependencies:
              DataProviderGetFamily._allTransitiveDependencies,
        );

  final TemplateDataProvider dataProvider;

  @override
  bool operator ==(Object other) {
    return other is DataProviderGetProvider &&
        other.dataProvider == dataProvider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dataProvider.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<DataProviderResult> runNotifierBuild(
    covariant DataProviderGet notifier,
  ) {
    return notifier.build(
      dataProvider,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
