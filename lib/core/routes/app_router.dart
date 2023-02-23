import 'package:flutter/material.dart';
import 'package:pockdex/features/pages/splash_page/splash_page.dart';

class AppRouter {
  static const splash = '/splash';

  static PageRoute<dynamic> generateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments as Map<String, dynamic>?;

    late final Widget page;

    switch (routeSettings.name) {
      case '/':
      case splash:
        page = const SplashPage();
        break;
      default:
        page = Container();
    }
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      settings: routeSettings,
    );
  }
}
