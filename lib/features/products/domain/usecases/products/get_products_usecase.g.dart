// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsUseCaseHash() =>
    r'b273653f179fba4460a1bb8a4c521530f97c8e01';

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

/// See also [getProductsUseCase].
@ProviderFor(getProductsUseCase)
const getProductsUseCaseProvider = GetProductsUseCaseFamily();

/// See also [getProductsUseCase].
class GetProductsUseCaseFamily
    extends Family<AsyncValue<Either<ServerException, ProductsResponse>>> {
  /// See also [getProductsUseCase].
  const GetProductsUseCaseFamily();

  /// See also [getProductsUseCase].
  GetProductsUseCaseProvider call({int? limit, int? skip}) {
    return GetProductsUseCaseProvider(limit: limit, skip: skip);
  }

  @override
  GetProductsUseCaseProvider getProviderOverride(
    covariant GetProductsUseCaseProvider provider,
  ) {
    return call(limit: provider.limit, skip: provider.skip);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProductsUseCaseProvider';
}

/// See also [getProductsUseCase].
class GetProductsUseCaseProvider
    extends
        AutoDisposeFutureProvider<Either<ServerException, ProductsResponse>> {
  /// See also [getProductsUseCase].
  GetProductsUseCaseProvider({int? limit, int? skip})
    : this._internal(
        (ref) => getProductsUseCase(
          ref as GetProductsUseCaseRef,
          limit: limit,
          skip: skip,
        ),
        from: getProductsUseCaseProvider,
        name: r'getProductsUseCaseProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getProductsUseCaseHash,
        dependencies: GetProductsUseCaseFamily._dependencies,
        allTransitiveDependencies:
            GetProductsUseCaseFamily._allTransitiveDependencies,
        limit: limit,
        skip: skip,
      );

  GetProductsUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.skip,
  }) : super.internal();

  final int? limit;
  final int? skip;

  @override
  Override overrideWith(
    FutureOr<Either<ServerException, ProductsResponse>> Function(
      GetProductsUseCaseRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductsUseCaseProvider._internal(
        (ref) => create(ref as GetProductsUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        skip: skip,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<ServerException, ProductsResponse>>
  createElement() {
    return _GetProductsUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductsUseCaseProvider &&
        other.limit == limit &&
        other.skip == skip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, skip.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetProductsUseCaseRef
    on AutoDisposeFutureProviderRef<Either<ServerException, ProductsResponse>> {
  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `skip` of this provider.
  int? get skip;
}

class _GetProductsUseCaseProviderElement
    extends
        AutoDisposeFutureProviderElement<
          Either<ServerException, ProductsResponse>
        >
    with GetProductsUseCaseRef {
  _GetProductsUseCaseProviderElement(super.provider);

  @override
  int? get limit => (origin as GetProductsUseCaseProvider).limit;
  @override
  int? get skip => (origin as GetProductsUseCaseProvider).skip;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
