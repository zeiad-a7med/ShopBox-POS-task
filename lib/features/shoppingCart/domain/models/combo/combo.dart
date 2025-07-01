import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart_item/cart_item.dart';

part 'combo.freezed.dart';
part 'combo.g.dart';

@freezed
abstract class Combo with _$Combo {
  const Combo._();
  const factory Combo({
    @Default([]) List<CartItem> comboItems,
    required String category,
  }) = _Combo;

  factory Combo.fromJson(Map<String, dynamic> json) => _$ComboFromJson(json);
  String get comboTitle => '$category Combo ';
  String get comboDescription {
    String productsHintsWithQuantity = '';
    for (final item in comboItems) {
      productsHintsWithQuantity += '${item.quantity} ${item.product.title} ';
      if (comboItems.indexOf(item) != comboItems.length - 1) {
        productsHintsWithQuantity += '+ ';
      }
    }
    return productsHintsWithQuantity;
  }
}
