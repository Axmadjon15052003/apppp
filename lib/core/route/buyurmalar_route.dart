import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singelton_dars/core/route_names/katalog_route_name.dart';
import 'package:singelton_dars/features/buyurtmalar/buyurtmalar_page.dart';

class BuyurmalarRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name ?? '';
    switch (routeName) {
      case KatalogRouteName.katalog:
        return CupertinoPageRoute(
          builder: (context) => const BuyurtmalarPage(),
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
