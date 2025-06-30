// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopbox_pos/common/routes/route_strings.dart';
import 'package:shopbox_pos/features/products/presentation/products_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

BuildContext get appContext => navigatorKey.currentContext!;

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    redirect: (context, state) {
      return state.matchedLocation;
    },
    routes: <GoRoute>[
      GoRoute(
        name: RouteStrings.initial,
        path: RouteStrings.initial,
        builder: (BuildContext context, GoRouterState state) {
          return ProductsPage();
        },
      ),
    ],
  );
});
