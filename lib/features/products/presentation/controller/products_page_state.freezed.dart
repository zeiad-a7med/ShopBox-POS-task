// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsPageState {

 List<Product> get products; bool get isPaginating; bool get hasMoreProducts; bool get connectedToNetwork; int get limit; int get skip; int get total;
/// Create a copy of ProductsPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsPageStateCopyWith<ProductsPageState> get copyWith => _$ProductsPageStateCopyWithImpl<ProductsPageState>(this as ProductsPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsPageState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isPaginating, isPaginating) || other.isPaginating == isPaginating)&&(identical(other.hasMoreProducts, hasMoreProducts) || other.hasMoreProducts == hasMoreProducts)&&(identical(other.connectedToNetwork, connectedToNetwork) || other.connectedToNetwork == connectedToNetwork)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),isPaginating,hasMoreProducts,connectedToNetwork,limit,skip,total);

@override
String toString() {
  return 'ProductsPageState(products: $products, isPaginating: $isPaginating, hasMoreProducts: $hasMoreProducts, connectedToNetwork: $connectedToNetwork, limit: $limit, skip: $skip, total: $total)';
}


}

/// @nodoc
abstract mixin class $ProductsPageStateCopyWith<$Res>  {
  factory $ProductsPageStateCopyWith(ProductsPageState value, $Res Function(ProductsPageState) _then) = _$ProductsPageStateCopyWithImpl;
@useResult
$Res call({
 List<Product> products, bool isPaginating, bool hasMoreProducts, bool connectedToNetwork, int limit, int skip, int total
});




}
/// @nodoc
class _$ProductsPageStateCopyWithImpl<$Res>
    implements $ProductsPageStateCopyWith<$Res> {
  _$ProductsPageStateCopyWithImpl(this._self, this._then);

  final ProductsPageState _self;
  final $Res Function(ProductsPageState) _then;

/// Create a copy of ProductsPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? isPaginating = null,Object? hasMoreProducts = null,Object? connectedToNetwork = null,Object? limit = null,Object? skip = null,Object? total = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,isPaginating: null == isPaginating ? _self.isPaginating : isPaginating // ignore: cast_nullable_to_non_nullable
as bool,hasMoreProducts: null == hasMoreProducts ? _self.hasMoreProducts : hasMoreProducts // ignore: cast_nullable_to_non_nullable
as bool,connectedToNetwork: null == connectedToNetwork ? _self.connectedToNetwork : connectedToNetwork // ignore: cast_nullable_to_non_nullable
as bool,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _ProductsPageState implements ProductsPageState {
  const _ProductsPageState({required final  List<Product> products, required this.isPaginating, required this.hasMoreProducts, required this.connectedToNetwork, required this.limit, required this.skip, required this.total}): _products = products;
  

 final  List<Product> _products;
@override List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  bool isPaginating;
@override final  bool hasMoreProducts;
@override final  bool connectedToNetwork;
@override final  int limit;
@override final  int skip;
@override final  int total;

/// Create a copy of ProductsPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsPageStateCopyWith<_ProductsPageState> get copyWith => __$ProductsPageStateCopyWithImpl<_ProductsPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsPageState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isPaginating, isPaginating) || other.isPaginating == isPaginating)&&(identical(other.hasMoreProducts, hasMoreProducts) || other.hasMoreProducts == hasMoreProducts)&&(identical(other.connectedToNetwork, connectedToNetwork) || other.connectedToNetwork == connectedToNetwork)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),isPaginating,hasMoreProducts,connectedToNetwork,limit,skip,total);

@override
String toString() {
  return 'ProductsPageState(products: $products, isPaginating: $isPaginating, hasMoreProducts: $hasMoreProducts, connectedToNetwork: $connectedToNetwork, limit: $limit, skip: $skip, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ProductsPageStateCopyWith<$Res> implements $ProductsPageStateCopyWith<$Res> {
  factory _$ProductsPageStateCopyWith(_ProductsPageState value, $Res Function(_ProductsPageState) _then) = __$ProductsPageStateCopyWithImpl;
@override @useResult
$Res call({
 List<Product> products, bool isPaginating, bool hasMoreProducts, bool connectedToNetwork, int limit, int skip, int total
});




}
/// @nodoc
class __$ProductsPageStateCopyWithImpl<$Res>
    implements _$ProductsPageStateCopyWith<$Res> {
  __$ProductsPageStateCopyWithImpl(this._self, this._then);

  final _ProductsPageState _self;
  final $Res Function(_ProductsPageState) _then;

/// Create a copy of ProductsPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? isPaginating = null,Object? hasMoreProducts = null,Object? connectedToNetwork = null,Object? limit = null,Object? skip = null,Object? total = null,}) {
  return _then(_ProductsPageState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,isPaginating: null == isPaginating ? _self.isPaginating : isPaginating // ignore: cast_nullable_to_non_nullable
as bool,hasMoreProducts: null == hasMoreProducts ? _self.hasMoreProducts : hasMoreProducts // ignore: cast_nullable_to_non_nullable
as bool,connectedToNetwork: null == connectedToNetwork ? _self.connectedToNetwork : connectedToNetwork // ignore: cast_nullable_to_non_nullable
as bool,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
