// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_parameter_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commodityParameterServiceHash() =>
    r'0541e5dddec83d0bdaf2088061b00ee55d05028c';

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

abstract class _$CommodityParameterService
    extends BuildlessAutoDisposeAsyncNotifier<Category> {
  late final int arg;

  FutureOr<Category> build(
    int arg,
  );
}

/// See also [CommodityParameterService].
@ProviderFor(CommodityParameterService)
const commodityParameterServiceProvider = CommodityParameterServiceFamily();

/// See also [CommodityParameterService].
class CommodityParameterServiceFamily extends Family<AsyncValue<Category>> {
  /// See also [CommodityParameterService].
  const CommodityParameterServiceFamily();

  /// See also [CommodityParameterService].
  CommodityParameterServiceProvider call(
    int arg,
  ) {
    return CommodityParameterServiceProvider(
      arg,
    );
  }

  @override
  CommodityParameterServiceProvider getProviderOverride(
    covariant CommodityParameterServiceProvider provider,
  ) {
    return call(
      provider.arg,
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
  String? get name => r'commodityParameterServiceProvider';
}

/// See also [CommodityParameterService].
class CommodityParameterServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CommodityParameterService,
        Category> {
  /// See also [CommodityParameterService].
  CommodityParameterServiceProvider(
    int arg,
  ) : this._internal(
          () => CommodityParameterService()..arg = arg,
          from: commodityParameterServiceProvider,
          name: r'commodityParameterServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commodityParameterServiceHash,
          dependencies: CommodityParameterServiceFamily._dependencies,
          allTransitiveDependencies:
              CommodityParameterServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  CommodityParameterServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.arg,
  }) : super.internal();

  final int arg;

  @override
  FutureOr<Category> runNotifierBuild(
    covariant CommodityParameterService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(CommodityParameterService Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommodityParameterServiceProvider._internal(
        () => create()..arg = arg,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        arg: arg,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CommodityParameterService, Category>
      createElement() {
    return _CommodityParameterServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommodityParameterServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommodityParameterServiceRef
    on AutoDisposeAsyncNotifierProviderRef<Category> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _CommodityParameterServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CommodityParameterService,
        Category> with CommodityParameterServiceRef {
  _CommodityParameterServiceProviderElement(super.provider);

  @override
  int get arg => (origin as CommodityParameterServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
