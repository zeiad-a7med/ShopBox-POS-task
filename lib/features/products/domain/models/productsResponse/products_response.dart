import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopbox_pos/features/products/domain/models/product/product.dart';
part 'products_response.freezed.dart';
part 'products_response.g.dart';
@freezed
abstract class ProductsResponse with _$ProductsResponse {
  const factory ProductsResponse({
    final int? total,
    final int? skip,
    final int? limit,
    final List<Product>? products
  }) = _ProductsResponse;
  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}