import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';
@freezed
abstract class Product with _$Product {
  const factory Product({
    final int? id,
    final String? title,
    final String? description,
    final String? category,
    final double? price,
    final double? discountPercentage,
    final double? rating,
    final int? stock,
    @Default([]) final List<String>? tags,
    final String? brand,
    final String? availabilityStatus,
    @Default([]) final List<String>? images,
    final String? thumbnail,
    final int? cartQuantity
  }) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}