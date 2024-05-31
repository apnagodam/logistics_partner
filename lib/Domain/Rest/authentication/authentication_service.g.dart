// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authenticationServiceHash() =>
    r'4d6cb2b302192c3bee537b4a648be1b930d6a90a';

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

abstract class _$AuthenticationService
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, dynamic>> {
  late final int arg;

  FutureOr<Map<String, dynamic>> build(
    int arg,
  );
}

/// See also [AuthenticationService].
@ProviderFor(AuthenticationService)
const authenticationServiceProvider = AuthenticationServiceFamily();

/// See also [AuthenticationService].
class AuthenticationServiceFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [AuthenticationService].
  const AuthenticationServiceFamily();

  /// See also [AuthenticationService].
  AuthenticationServiceProvider call(
    int arg,
  ) {
    return AuthenticationServiceProvider(
      arg,
    );
  }

  @override
  AuthenticationServiceProvider getProviderOverride(
    covariant AuthenticationServiceProvider provider,
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
  String? get name => r'authenticationServiceProvider';
}

/// See also [AuthenticationService].
class AuthenticationServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AuthenticationService,
        Map<String, dynamic>> {
  /// See also [AuthenticationService].
  AuthenticationServiceProvider(
    int arg,
  ) : this._internal(
          () => AuthenticationService()..arg = arg,
          from: authenticationServiceProvider,
          name: r'authenticationServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authenticationServiceHash,
          dependencies: AuthenticationServiceFamily._dependencies,
          allTransitiveDependencies:
              AuthenticationServiceFamily._allTransitiveDependencies,
          arg: arg,
        );

  AuthenticationServiceProvider._internal(
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
    covariant AuthenticationService notifier,
  ) {
    return notifier.build(
      arg,
    );
  }

  @override
  Override overrideWith(AuthenticationService Function() create) {
    return ProviderOverride(
      origin: this,
      override: AuthenticationServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AuthenticationService,
      Map<String, dynamic>> createElement() {
    return _AuthenticationServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthenticationServiceProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuthenticationServiceRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, dynamic>> {
  /// The parameter `arg` of this provider.
  int get arg;
}

class _AuthenticationServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AuthenticationService,
        Map<String, dynamic>> with AuthenticationServiceRef {
  _AuthenticationServiceProviderElement(super.provider);

  @override
  int get arg => (origin as AuthenticationServiceProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
