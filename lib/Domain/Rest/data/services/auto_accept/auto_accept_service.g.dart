// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_accept_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoAcceptServiceHash() => r'e5dae3101d7d36a0821a016a9a09876091e73a50';

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

abstract class _$AutoAcceptService
    extends BuildlessAsyncNotifier<Map<String, dynamic>> {
  late final int arg;

  FutureOr<Map<String, dynamic>> build(
    int arg,
  );
}

/// See also [AutoAcceptService].
@ProviderFor(AutoAcceptService)
const autoAcceptServiceProvider = AutoAcceptServiceFamily();

/// See also [AutoAcceptService].
class AutoAcceptServiceFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [AutoAcceptService].
  const AutoAcceptServiceFamily();

  /// See also [AutoAcceptService].
  AutoAcceptServiceProvider call(
    int arg,
  ) {
    return AutoAcceptServiceProvider(
      arg,
    );
  }

  @override
  AutoAcceptServiceProvider getProviderOverride(
    covariant AutoAcceptServiceProvider provider,
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
  String? get name => r'autoAcceptServiceProvider';
}

/// See also [AutoAcceptService].
class AutoAcceptServiceProvider
    extends AsyncNotifierProviderImpl<AutoAcceptService, Map<String, dynamic>> {
  /// See also [AutoAcceptService].
  AutoAcceptServiceProvider(
    int arg,
  ) : this._internal(
          () => AutoAcceptService()..arg = arg,
          from: autoAcceptServiceProvider,
          name: r'autoAcceptServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autoAcceptServiceHash,
          dependencies: AutoAcceptServiceFamily._dependencies,
          allTransitiveDependencies:
              AutoAcceptServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  AutoAcceptServiceProvider._internal(
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
  FutureOr<Map<String, dynamic>> runNotifierBuild(
    covariant AutoAcceptService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(AutoAcceptService Function() create) {
    return ProviderOverride(
      origin: this,
      override: AutoAcceptServiceProvider._internal(
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
  AsyncNotifierProviderElement<AutoAcceptService, Map<String, dynamic>>
      createElement() {
    return _AutoAcceptServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutoAcceptServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AutoAcceptServiceRef on AsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _AutoAcceptServiceProviderElement extends AsyncNotifierProviderElement<
    AutoAcceptService, Map<String, dynamic>> with AutoAcceptServiceRef {
  _AutoAcceptServiceProviderElement(super.provider);

  @override
  int get arg => (origin as AutoAcceptServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
