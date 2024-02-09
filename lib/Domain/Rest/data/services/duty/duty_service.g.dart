// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dutyServiceHash() => r'a9bd31c4209a287228ca1e5d5320e5d5c8541b05';

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

abstract class _$DutyService
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, dynamic>> {
  late final int arg;

  FutureOr<Map<String, dynamic>> build(
    int arg,
  );
}

/// See also [DutyService].
@ProviderFor(DutyService)
const dutyServiceProvider = DutyServiceFamily();

/// See also [DutyService].
class DutyServiceFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [DutyService].
  const DutyServiceFamily();

  /// See also [DutyService].
  DutyServiceProvider call(
    int arg,
  ) {
    return DutyServiceProvider(
      arg,
    );
  }

  @override
  DutyServiceProvider getProviderOverride(
    covariant DutyServiceProvider provider,
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
  String? get name => r'dutyServiceProvider';
}

/// See also [DutyService].
class DutyServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DutyService, Map<String, dynamic>> {
  /// See also [DutyService].
  DutyServiceProvider(
    int arg,
  ) : this._internal(
          () => DutyService()..arg = arg,
          from: dutyServiceProvider,
          name: r'dutyServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dutyServiceHash,
          dependencies: DutyServiceFamily._dependencies,
          allTransitiveDependencies:
              DutyServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  DutyServiceProvider._internal(
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
    covariant DutyService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(DutyService Function() create) {
    return ProviderOverride(
      origin: this,
      override: DutyServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DutyService, Map<String, dynamic>>
      createElement() {
    return _DutyServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DutyServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DutyServiceRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _DutyServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DutyService,
        Map<String, dynamic>> with DutyServiceRef {
  _DutyServiceProviderElement(super.provider);

  @override
  int get arg => (origin as DutyServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
