import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopbox_pos/features/products/domain/models/product/product.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required int quantity,
    @Default(false) bool isCombo,
    String? comboName,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
} 