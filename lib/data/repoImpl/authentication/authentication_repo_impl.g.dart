// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_repo_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendOtpHash() => r'd2d0b64972fe04f4e9ba3561cf8fa0288c362261';

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

/// See also [sendOtp].
@ProviderFor(sendOtp)
const sendOtpProvider = SendOtpFamily();

/// See also [sendOtp].
class SendOtpFamily extends Family<AsyncValue<OtpResponseModel>> {
  /// See also [sendOtp].
  const SendOtpFamily();

  /// See also [sendOtp].
  SendOtpProvider call({
    required int phoneNumber,
  }) {
    return SendOtpProvider(
      phoneNumber: phoneNumber,
    );
  }

  @override
  SendOtpProvider getProviderOverride(
    covariant SendOtpProvider provider,
  ) {
    return call(
      phoneNumber: provider.phoneNumber,
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
  String? get name => r'sendOtpProvider';
}

/// See also [sendOtp].
class SendOtpProvider extends AutoDisposeFutureProvider<OtpResponseModel> {
  /// See also [sendOtp].
  SendOtpProvider({
    required int phoneNumber,
  }) : this._internal(
          (ref) => sendOtp(
            ref as SendOtpRef,
            phoneNumber: phoneNumber,
          ),
          from: sendOtpProvider,
          name: r'sendOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendOtpHash,
          dependencies: SendOtpFamily._dependencies,
          allTransitiveDependencies: SendOtpFamily._allTransitiveDependencies,
          phoneNumber: phoneNumber,
        );

  SendOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phoneNumber,
  }) : super.internal();

  final int phoneNumber;

  @override
  Override overrideWith(
    FutureOr<OtpResponseModel> Function(SendOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendOtpProvider._internal(
        (ref) => create(ref as SendOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phoneNumber: phoneNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OtpResponseModel> createElement() {
    return _SendOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendOtpProvider && other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendOtpRef on AutoDisposeFutureProviderRef<OtpResponseModel> {
  /// The parameter `phoneNumber` of this provider.
  int get phoneNumber;
}

class _SendOtpProviderElement
    extends AutoDisposeFutureProviderElement<OtpResponseModel> with SendOtpRef {
  _SendOtpProviderElement(super.provider);

  @override
  int get phoneNumber => (origin as SendOtpProvider).phoneNumber;
}

String _$verifyOtpHash() => r'bcec930179d96578e0eab7f2660aae5c7d92ac72';

/// See also [verifyOtp].
@ProviderFor(verifyOtp)
const verifyOtpProvider = VerifyOtpFamily();

/// See also [verifyOtp].
class VerifyOtpFamily extends Family<AsyncValue<AuthenticationModel>> {
  /// See also [verifyOtp].
  const VerifyOtpFamily();

  /// See also [verifyOtp].
  VerifyOtpProvider call({
    required String otp,
    required String phoneNumber,
  }) {
    return VerifyOtpProvider(
      otp: otp,
      phoneNumber: phoneNumber,
    );
  }

  @override
  VerifyOtpProvider getProviderOverride(
    covariant VerifyOtpProvider provider,
  ) {
    return call(
      otp: provider.otp,
      phoneNumber: provider.phoneNumber,
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
  String? get name => r'verifyOtpProvider';
}

/// See also [verifyOtp].
class VerifyOtpProvider extends AutoDisposeFutureProvider<AuthenticationModel> {
  /// See also [verifyOtp].
  VerifyOtpProvider({
    required String otp,
    required String phoneNumber,
  }) : this._internal(
          (ref) => verifyOtp(
            ref as VerifyOtpRef,
            otp: otp,
            phoneNumber: phoneNumber,
          ),
          from: verifyOtpProvider,
          name: r'verifyOtpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOtpHash,
          dependencies: VerifyOtpFamily._dependencies,
          allTransitiveDependencies: VerifyOtpFamily._allTransitiveDependencies,
          otp: otp,
          phoneNumber: phoneNumber,
        );

  VerifyOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.otp,
    required this.phoneNumber,
  }) : super.internal();

  final String otp;
  final String phoneNumber;

  @override
  Override overrideWith(
    FutureOr<AuthenticationModel> Function(VerifyOtpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyOtpProvider._internal(
        (ref) => create(ref as VerifyOtpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        otp: otp,
        phoneNumber: phoneNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AuthenticationModel> createElement() {
    return _VerifyOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOtpProvider &&
        other.otp == otp &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyOtpRef on AutoDisposeFutureProviderRef<AuthenticationModel> {
  /// The parameter `otp` of this provider.
  String get otp;

  /// The parameter `phoneNumber` of this provider.
  String get phoneNumber;
}

class _VerifyOtpProviderElement
    extends AutoDisposeFutureProviderElement<AuthenticationModel>
    with VerifyOtpRef {
  _VerifyOtpProviderElement(super.provider);

  @override
  String get otp => (origin as VerifyOtpProvider).otp;
  @override
  String get phoneNumber => (origin as VerifyOtpProvider).phoneNumber;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
