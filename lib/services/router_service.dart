import 'package:flutter/widgets.dart';

class RouterService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //push the new screen on top of the old one
  Future<dynamic> push(String route, {dynamic args}) async {
    return await navigatorKey.currentState!.pushNamed(route, arguments: args);
  }

  // push the new screen and replace the old one
  Future<dynamic> pushReplacement(String route, {dynamic args}) async {
    return await navigatorKey.currentState!
        .pushReplacementNamed(route, arguments: args);
  }

  //push the new screen and delete the old one
  Future<dynamic> pushNamedAndRemoveUntil(String route, {dynamic args}) async {
    return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route, (Route<dynamic> route) => false,
        arguments: args);
  }

  //pop screen
  pop() {
    navigatorKey.currentState!.pop();
  }
}
