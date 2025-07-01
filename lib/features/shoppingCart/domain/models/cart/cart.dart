import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart_item/cart_item.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/combo/combo.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({@Default([]) List<CartItem> items}) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

extension CartExtension on Cart {
  double get totalAmount {
    return items.fold(0.0, (sum, item) {
      final price = item.product.price ?? 0.0;
      return sum + (price * item.quantity);
    });
  }

  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  int get uniqueItemsCount {
    return items.length;
  }

  Map<String, List<CartItem>> get itemsByCategory {
    final Map<String, List<CartItem>> categoryMap = {};

    for (final item in items) {
      final category = item.product.category ?? 'Unknown';
      if (!categoryMap.containsKey(category)) {
        categoryMap[category] = [];
      }
      categoryMap[category]!.add(item);
    }

    return categoryMap;
  }

  List<Combo> getComboItems() {
    final List<Combo> combos = [];
    final List<CartItem> comboItems = [];
    final categoryMap = itemsByCategory;

    for (final entry in categoryMap.entries) {
      
      final category = entry.key;
      final categoryItems = entry.value;

      //The combo must be collected with different products 
      if(categoryItems.length <= 1){
        continue;
      }
      // Calculate total quantity for this category
      final totalQuantity = categoryItems.fold(
        0,
        (sum, item) => sum + item.quantity,
      );

      // If total quantity reaches 6, mark all items as combo
      if (totalQuantity >= 6) {
        for (final item in categoryItems) {
          comboItems.add(
            item.copyWith(isCombo: true, comboName: '$category Combo'),
          );
        }
        combos.add(Combo(comboItems: categoryItems, category: category));
      }
    }

    return combos;
  }
}
