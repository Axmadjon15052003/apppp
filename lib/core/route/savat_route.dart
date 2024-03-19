import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singelton_dars/core/route_names/savat_route_name.dart';
import 'package:singelton_dars/features/savat/savat_page.dart';

class SavatRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name ?? '';
    switch (routeName) {
      case SavatRoutename.savat:
        return CupertinoPageRoute(
          builder: (context) => const SavatPage(),
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
