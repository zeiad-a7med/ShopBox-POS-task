import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopbox_pos/core/Helpers/Dio/dio_helper.dart';
import 'package:shopbox_pos/core/Helpers/sharedPreference/cache_manager.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.init();
  DioHelper.init();
  runApp(
    ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          return const MyApp();
        },
      ),
    ),
  );
}
