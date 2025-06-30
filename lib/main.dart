import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopbox_pos/Helpers/Dio/dio_helper.dart';
import 'app.dart';

void main() {
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
