import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopbox_pos/Helpers/sharedPreference/cache_manager.dart';
import 'package:shopbox_pos/features/products/domain/models/product/product.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart/cart.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart_item/cart_item.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/combo/combo.dart';

part 'cart_controller.g.dart';

@Riverpod(keepAlive: true)
class CartController extends _$CartController {
  @override
  FutureOr<Cart> build() async {

    final cart = CacheManager.instance.cart;
    return cart ?? const Cart();
  }
 
  Cart? getCart() => state.value;

  
  void addItem(Product product, int quantity) {
    final existingItemIndex = state.requireValue.items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      // Update existing item quantity
      final existingItem = state.requireValue.items[existingItemIndex];
      final newQuantity = existingItem.quantity + quantity;
      
      final updatedItems = List<CartItem>.from(state.requireValue.items);
      updatedItems[existingItemIndex] = existingItem.copyWith(quantity: newQuantity);
      
      state = AsyncData(state.requireValue.copyWith(items: updatedItems));
    } else {
      // Add new item
      final newItem = CartItem(product: product, quantity: quantity);
      final updatedItems = List<CartItem>.from(state.requireValue.items)..add(newItem);
      
      state = AsyncData(state.requireValue.copyWith(items: updatedItems));
    }
    
    CacheManager.instance.updateCart(state.requireValue);
  }

  
  void removeItem(Product product) {
    final updatedItems = state.requireValue.items.where(
      (item) => item.product.id != product.id,
    ).toList();
    
    state = AsyncData(state.requireValue.copyWith(items: updatedItems));
    
    // Save to cache
    CacheManager.instance.updateCart(state.requireValue);
  }

  
  void updateQuantity(Product product, int quantity) {
    if (quantity <= 0) {
      removeItem(product);
      return;
    }

    final existingItemIndex = state.requireValue.items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      final existingItem = state.requireValue.items[existingItemIndex];
      final updatedItems = List<CartItem>.from(state.requireValue.items);
      updatedItems[existingItemIndex] = existingItem.copyWith(quantity: quantity);
      state = AsyncData(state.requireValue.copyWith(items: updatedItems));
      // Save to cache
      CacheManager.instance.updateCart(state.requireValue);
    }
  }

  
  void clearCart() {
    state = AsyncData(const Cart());
    
    // Clear from cache
    CacheManager.instance.clearCart();
  }

  
  List<Combo> getComboItems() {
    return state.requireValue.getComboItems();
  }

}
