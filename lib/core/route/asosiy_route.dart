import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singelton_dars/core/route_names/asosiy_route_name.dart';
import 'package:singelton_dars/features/asosiy/asosit_page.dart';

class AsosiyRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name ?? '';
    switch (routeName) {
      case AsosiyRouteName.asosiy:
        return CupertinoPageRoute(
          builder: (context) => const AsosiyPage(),
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
