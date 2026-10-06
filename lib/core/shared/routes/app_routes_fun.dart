import '../routes/app_routes.dart';
import 'package:flutter/material.dart';

String? currentRouteName;
dynamic currentRouteArgs;

final AppRouteObserver appRouteObserver = AppRouteObserver();

class AppRouteObserver extends NavigatorObserver {
  void _setRoute(Route? route) {
    if (route is PageRoute) {
      currentRouteName = route.settings.name;
      currentRouteArgs = route.settings.arguments;
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) => _setRoute(route);

  @override
  void didPop(Route route, Route? previousRoute) => _setRoute(previousRoute);

  @override
  void didRemove(Route route, Route? previousRoute) => _setRoute(previousRoute);

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) => _setRoute(newRoute);
}

Future<dynamic> push(String named, {dynamic arg, NavigatorAnimation? type}) {
  return Navigator.of(
    navigator.currentContext!,
  ).push(SlideRight(named: named, arguments: arg, type: type));
}

Future<dynamic> replacement(
  String named, {
  dynamic arg,
  NavigatorAnimation? type,
}) {
  return Navigator.of(
    navigator.currentContext!,
  ).pushReplacement(SlideRight(named: named, arguments: arg, type: type));
}

Future<dynamic> pushAndRemoveUntil(
  String child, {
  dynamic arg,
  NavigatorAnimation? type,
}) {
  return Navigator.of(navigator.currentContext!).pushAndRemoveUntil(
    SlideRight(named: child, arguments: arg, type: type),
    (route) => false,
  );
}

class SlideRight extends PageRouteBuilder {
  final String named;
  final dynamic arguments;
  final NavigatorAnimation? type;
  SlideRight({required this.named, this.arguments, this.type})
    : super(
        settings: RouteSettings(arguments: arguments, name: named),
        pageBuilder: (context, animation, secondaryAnimation) {
          return AppRoutes.init.appRoutes[named]!(context);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (type) {
            case NavigatorAnimation.position:
              {
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              }
            case NavigatorAnimation.scale:
              {
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.1, end: 1).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.decelerate,
                    ),
                  ),
                  child: child,
                );
              }
            default:
              {
                return FadeTransition(opacity: animation, child: child);
              }
          }
        },
      );
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

enum NavigatorAnimation { opacity, scale, position }

Future<T?> showAppSheet<T>(Widget widget) {
  return showModalBottomSheet<T>(
    context: navigator.currentContext!,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => widget,
  );
}

Future<T?> showAppDialog<T>(Widget widget) {
  return showDialog<T>(
    context: navigator.currentContext!,
    builder: (context) => widget,
  );
}
