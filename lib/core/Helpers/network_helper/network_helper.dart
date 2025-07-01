// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_helper.g.dart';

@riverpod
INetworkHelper networkHelper(Ref ref) {
  return NetworkHelper();
}

abstract class INetworkHelper {
  Future<bool> get isConnected;
  Future<bool> get isNotConnected;
  Stream<List<ConnectivityResult>> get onConnectivityChanged;
  ConnectivityResult? currentNetworkState;
}

class NetworkHelper implements INetworkHelper {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResult =
        await _connectivity.checkConnectivity();

    // ✅ This ensures that a connectivity listener is established properly
    _connectivity.onConnectivityChanged.listen((result) {});

    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  Future<bool> get isNotConnected async => !(await isConnected);

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  @override
  ConnectivityResult? currentNetworkState;
}
