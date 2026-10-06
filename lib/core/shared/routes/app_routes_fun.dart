import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

Future<dynamic> push(String named, {dynamic arg}) {
  return Navigator.of(
    navigator.currentContext!,
  ).push(FadeRoute(named: named, arguments: arg));
}

Future<dynamic> replacement(String named, {dynamic arg}) {
  return Navigator.of(
    navigator.currentContext!,
  ).pushReplacement(FadeRoute(named: named, arguments: arg));
}

Future<dynamic> pushAndRemoveUntil(String named, {dynamic arg}) {
  return Navigator.of(navigator.currentContext!).pushAndRemoveUntil(
    FadeRoute(named: named, arguments: arg),
    (route) => false,
  );
}

/// Opens a named route from [AppRoutes] with a fade.
class FadeRoute extends PageRouteBuilder {
  final String named;
  final dynamic arguments;

  FadeRoute({required this.named, this.arguments})
    : super(
        settings: RouteSettings(arguments: arguments, name: named),
        pageBuilder: (context, animation, secondaryAnimation) =>
            AppRoutes.init.appRoutes[named]!(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      );
}
