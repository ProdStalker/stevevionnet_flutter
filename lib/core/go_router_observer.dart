import 'package:flutter/material.dart';

class GoRouterObserver implements NavigatorObserver {
  GoRouterObserver();

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('didPop: ${previousRoute?.settings.name} => ${route.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('didPush: ${previousRoute?.settings.name} => ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    debugPrint('didRemove: ${previousRoute?.settings.name} => ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint('didReplace: ${oldRoute?.settings.name} => ${newRoute?.settings.name}');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    debugPrint('didStartUserGesture: ${previousRoute?.settings.name} => ${route.settings.name}');
  }

  @override
  void didStopUserGesture() {
    debugPrint('didStopUserGesture');
  }

  @override
  // TODO: implement navigator
  NavigatorState? get navigator => null;
}