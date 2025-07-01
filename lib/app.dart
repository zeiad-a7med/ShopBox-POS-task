import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopbox_pos/core/routes/router_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopbox_pos/core/constants/app_settings.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final routerP = ref.watch(routerProvider);
    final routerDelegate = routerP.routerDelegate;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: kDebugMode,
          showSemanticsDebugger: false,
          title: AppSettings.appName,
          routerDelegate: routerDelegate,
          routeInformationParser: routerP.routeInformationParser,
          routeInformationProvider: routerP.routeInformationProvider,
        );
      },
    );
  }
}