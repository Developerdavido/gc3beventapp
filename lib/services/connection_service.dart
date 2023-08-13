
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gc3bapp/constants/utils.dart';

import '../constants/colors.dart';

class ConnectionService {

  StreamSubscription? _subscription;

  final StreamController<ConnectivityResult> _controller = StreamController<ConnectivityResult>.broadcast();

  Stream<ConnectivityResult> get stream => _controller.stream;


  checkConnection() async {
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi || result == ConnectivityResult.ethernet) {
        Utils.showConnectionSnackBar( color: Colors.red,
            timeout: 2,
            barrierDismissible: true,
            message: "No Internet Connection. Check your internet connectivity");
      }else {
        Utils.showConnectionSnackBar( color: Colors.green,
            timeout: 2,
            barrierDismissible: true,
            message: "Internet connectivity restored");
      }
      _controller.add(result);
      });
        }


  closeConnection() {
    _subscription!.cancel();
  }
}