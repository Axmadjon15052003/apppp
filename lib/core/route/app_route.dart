import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singelton_dars/core/route_names/app_route_names.dart';
import 'package:singelton_dars/features/authenfication/presentation/pages/splash_screen.dart';
import 'package:singelton_dars/features/home/home_screen.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name ?? '';
    switch (routeName) {
      case AppRouteNames.splash:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        );
        case AppRouteNames.home:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(
                "Error",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
    }
  }
}
