import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopbox_pos/features/products/domain/models/product/product.dart';

part 'products_page_state.freezed.dart';

@freezed
abstract class ProductsPageState with _$ProductsPageState {
  const factory ProductsPageState({
    required final List<Product> products,
    required final bool isPaginating,
    required final bool hasMoreProducts,
    required final int limit,
    required final int skip,
    required final int total,
  }) = _ProductsPageState;
}
