// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsPageControllerHash() =>
    r'ede1283549facab5ef1d8269739aef24a19c8122';

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

abstract class _$ProductsPageController
    extends BuildlessAutoDisposeAsyncNotifier<ProductsPageState> {
  late final ScrollController scrollController;

  FutureOr<ProductsPageState> build({
    required ScrollController scrollController,
  });
}

/// See also [ProductsPageController].
@ProviderFor(ProductsPageController)
const productsPageControllerProvider = ProductsPageControllerFamily();

/// See also [ProductsPageController].
class ProductsPageControllerFamily
    extends Family<AsyncValue<ProductsPageState>> {
  /// See also [ProductsPageController].
  const ProductsPageControllerFamily();

  /// See also [ProductsPageController].
  ProductsPageControllerProvider call({
    required ScrollController scrollController,
  }) {
    return ProductsPageControllerProvider(scrollController: scrollController);
  }

  @override
  ProductsPageControllerProvider getProviderOverride(
    covariant ProductsPageControllerProvider provider,
  ) {
    return call(scrollController: provider.scrollController);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productsPageControllerProvider';
}

/// See also [ProductsPageController].
class ProductsPageControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProductsPageController,
          ProductsPageState
        > {
  /// See also [ProductsPageController].
  ProductsPageControllerProvider({required ScrollController scrollController})
    : this._internal(
        () => ProductsPageController()..scrollController = scrollController,
        from: productsPageControllerProvider,
        name: r'productsPageControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productsPageControllerHash,
        dependencies: ProductsPageControllerFamily._dependencies,
        allTransitiveDependencies:
            ProductsPageControllerFamily._allTransitiveDependencies,
        scrollController: scrollController,
      );

  ProductsPageControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.scrollController,
  }) : super.internal();

  final ScrollController scrollController;

  @override
  FutureOr<ProductsPageState> runNotifierBuild(
    covariant ProductsPageController notifier,
  ) {
    return notifier.build(scrollController: scrollController);
  }

  @override
  Override overrideWith(ProductsPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductsPageControllerProvider._internal(
        () => create()..scrollController = scrollController,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        scrollController: scrollController,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    ProductsPageController,
    ProductsPageState
  >
  createElement() {
    return _ProductsPageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsPageControllerProvider &&
        other.scrollController == scrollController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, scrollController.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductsPageControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProductsPageState> {
  /// The parameter `scrollController` of this provider.
  ScrollController get scrollController;
}

class _ProductsPageControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProductsPageController,
          ProductsPageState
        >
    with ProductsPageControllerRef {
  _ProductsPageControllerProviderElement(super.provider);

  @override
  ScrollController get scrollController =>
      (origin as ProductsPageControllerProvider).scrollController;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
