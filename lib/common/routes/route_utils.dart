// 🎯 Dart imports:
import 'dart:core';
import 'package:go_router/go_router.dart';
import 'package:shopbox_pos/common/routes/route_strings.dart';
import 'package:shopbox_pos/common/routes/router_provider.dart';

class RouteUtils {
  static void goToShoppingCart() {
    appContext.pushNamed(RouteStrings.shoppingCart);
  }
}
