import 'package:flutter/material.dart';

import 'provider_callback.dart';

class NavigationObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    callBackProvider.init(value: route.navigator!.context);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    callBackProvider.init(value: route.navigator!.context);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    callBackProvider.init(value: route.navigator!.context);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    callBackProvider.init(value: newRoute!.navigator!.context);
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    callBackProvider.init(value: route.navigator!.context);
  }
}

