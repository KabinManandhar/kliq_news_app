import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { notDetermined, isConnected, isDisonnected }

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();

  ConnectivityStatus? lastResult;
  ConnectivityStatus? newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
    if (state == ConnectivityStatus.isConnected) {
      lastResult = ConnectivityStatus.isConnected;
    } else {
      lastResult = ConnectivityStatus.isDisonnected;
    }
    lastResult = ConnectivityStatus.notDetermined;
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.wifi)) {
        newState = ConnectivityStatus.isConnected;
      } else if (result.contains(ConnectivityResult.mobile)) {
        newState = ConnectivityStatus.isConnected;
      } else if (result.contains(ConnectivityResult.none)) {
        newState = ConnectivityStatus.isDisonnected;
      }

      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}

final connectivityStatusProviders = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});
