import 'package:flutter_test/flutter_test.dart';
import 'package:shopbox_pos/features/products/domain/models/product/product.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart/cart.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart_item/cart_item.dart';

void main() {
  group('Cart Tests', () {
    late Product testProduct1;
    late Product testProduct2;
    late Product testProduct3;

    setUp(() {
      testProduct1 = Product(
        id: 1,
        title: 'Burger',
        category: 'fast-food',
        price: 10.0,
      );
      
      testProduct2 = Product(
        id: 2,
        title: 'Fries',
        category: 'fast-food',
        price: 5.0,
      );
      
      testProduct3 = Product(
        id: 3,
        title: 'Drink',
        category: 'fast-food',
        price: 3.0,
      );
    });

    test('should calculate total amount correctly', () {
      final cart = Cart(items: [
        CartItem(product: testProduct1, quantity: 2),
        CartItem(product: testProduct2, quantity: 1),
      ]);

      expect(cart.totalAmount, 25.0); // 2 * 10 + 1 * 5 = 25
    });

    test('should calculate total items correctly', () {
      final cart = Cart(items: [
        CartItem(product: testProduct1, quantity: 2),
        CartItem(product: testProduct2, quantity: 3),
      ]);

      expect(cart.totalItems, 5); // 2 + 3 = 5
    });


    test('should not detect combo when total quantity is less than 6', () {
      final cart = Cart(items: [
        CartItem(product: testProduct1, quantity: 1), // Burger
        CartItem(product: testProduct2, quantity: 2), // Fries
        CartItem(product: testProduct3, quantity: 2), // Drink
      ]);

      final comboItems = cart.getComboItems();
      
      expect(comboItems.length, 0);
    });

    test('should group items by category correctly', () {
      final cart = Cart(items: [
        CartItem(product: testProduct1, quantity: 1),
        CartItem(product: testProduct2, quantity: 1),
        CartItem(product: testProduct3, quantity: 1),
      ]);

      final itemsByCategory = cart.itemsByCategory;
      
      expect(itemsByCategory['fast-food']?.length, 3);
      expect(itemsByCategory.keys.length, 1);
    });
  });
} 