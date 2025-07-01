import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopbox_pos/core/Helpers/sharedPreference/cache_keys.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart/cart.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  static late SharedPreferences _prefs;

  Cart? _cachedCart;

  Cart? get cart => _cachedCart;
  CacheManager._internal();
  static CacheManager get instance => _instance;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final cartString = _prefs.getString(CacheKeys.cart);
    if (cartString != null && cartString != "null") {
      final Map<String, dynamic> cartMap = jsonDecode(cartString);
      _instance._cachedCart = Cart.fromJson(cartMap);
    }
  }
  Future<void> updateCart(Cart cart) async {
    final cartJson = jsonEncode(cart.toJson());
    await _prefs.setString(CacheKeys.cart, cartJson);
    _cachedCart = cart;
  }

  Future<void> clearCart() async {
    await _prefs.remove(CacheKeys.cart);
    _cachedCart = null;
  }
}
