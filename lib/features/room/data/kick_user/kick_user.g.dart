// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kick_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kickUserHash() => r'a332205fae63f2fd86349f782f915b0e3794e80a';

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

/// See also [kickUser].
@ProviderFor(kickUser)
const kickUserProvider = KickUserFamily();

/// See also [kickUser].
class KickUserFamily extends Family<AsyncValue<void>> {
  /// See also [kickUser].
  const KickUserFamily();

  /// See also [kickUser].
  KickUserProvider call({required String userId}) {
    return KickUserProvider(userId: userId);
  }

  @override
  KickUserProvider getProviderOverride(covariant KickUserProvider provider) {
    return call(userId: provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'kickUserProvider';
}

/// See also [kickUser].
class KickUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [kickUser].
  KickUserProvider({required String userId})
    : this._internal(
        (ref) => kickUser(ref as KickUserRef, userId: userId),
        from: kickUserProvider,
        name: r'kickUserProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$kickUserHash,
        dependencies: KickUserFamily._dependencies,
        allTransitiveDependencies: KickUserFamily._allTransitiveDependencies,
        userId: userId,
      );

  KickUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(FutureOr<void> Function(KickUserRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: KickUserProvider._internal(
        (ref) => create(ref as KickUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _KickUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KickUserProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin KickUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _KickUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with KickUserRef {
  _KickUserProviderElement(super.provider);

  @override
  String get userId => (origin as KickUserProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
