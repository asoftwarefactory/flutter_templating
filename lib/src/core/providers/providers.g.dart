// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$templateRenderInputHash() =>
    r'be6dd17b004225561d61f99a413a81f51650e73b';

/// See also [templateRenderInput].
@ProviderFor(templateRenderInput)
final templateRenderInputProvider = Provider<TemplateRenderInput>.internal(
  templateRenderInput,
  name: r'templateRenderInputProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$templateRenderInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TemplateRenderInputRef = ProviderRef<TemplateRenderInput>;
String _$mainFormHash() => r'2594f4a527839849b6e6c85167c5a91f23ae3cd7';

/// See also [mainForm].
@ProviderFor(mainForm)
final mainFormProvider = Provider<FormGroup>.internal(
  mainForm,
  name: r'mainFormProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mainFormHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MainFormRef = ProviderRef<FormGroup>;
String _$autocompletesHash() => r'a87f9cf46006f6beab39f03c9fdf3e725b86bbf8';

/// See also [autocompletes].
@ProviderFor(autocompletes)
final autocompletesProvider = FutureProvider<List<AutocompleteModel>>.internal(
  autocompletes,
  name: r'autocompletesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autocompletesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AutocompletesRef = FutureProviderRef<List<AutocompleteModel>>;
String _$sectionItemsHash() => r'bbe72927a8df41331afcf17563201300bfc1de26';

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

typedef SectionItemsRef = ProviderRef<List<Item>>;

/// See also [sectionItems].
@ProviderFor(sectionItems)
const sectionItemsProvider = SectionItemsFamily();

/// See also [sectionItems].
class SectionItemsFamily extends Family<List<Item>> {
  /// See also [sectionItems].
  const SectionItemsFamily();

  /// See also [sectionItems].
  SectionItemsProvider call(
    String sectionId,
  ) {
    return SectionItemsProvider(
      sectionId,
    );
  }

  @override
  SectionItemsProvider getProviderOverride(
    covariant SectionItemsProvider provider,
  ) {
    return call(
      provider.sectionId,
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
  String? get name => r'sectionItemsProvider';
}

/// See also [sectionItems].
class SectionItemsProvider extends Provider<List<Item>> {
  /// See also [sectionItems].
  SectionItemsProvider(
    this.sectionId,
  ) : super.internal(
          (ref) => sectionItems(
            ref,
            sectionId,
          ),
          from: sectionItemsProvider,
          name: r'sectionItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sectionItemsHash,
          dependencies: SectionItemsFamily._dependencies,
          allTransitiveDependencies:
              SectionItemsFamily._allTransitiveDependencies,
        );

  final String sectionId;

  @override
  bool operator ==(Object other) {
    return other is SectionItemsProvider && other.sectionId == sectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$itemsStateHash() => r'0ae1ae27e16718526e5ba1d98590d12be7a903c4';

/// See also [ItemsState].
@ProviderFor(ItemsState)
final itemsStateProvider =
    NotifierProvider<ItemsState, Map<String, List<Item>>>.internal(
  ItemsState.new,
  name: r'itemsStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemsState = Notifier<Map<String, List<Item>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
