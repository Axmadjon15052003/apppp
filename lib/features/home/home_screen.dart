import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:singelton_dars/assets/colors/color.dart';
import 'package:singelton_dars/assets/widgets/icons.dart';
import 'package:singelton_dars/core/route/asosiy_route.dart';
import 'package:singelton_dars/core/route/buyurmalar_route.dart';
import 'package:singelton_dars/core/route/katalog_route.dart';
import 'package:singelton_dars/core/route/profile_route.dart';
import 'package:singelton_dars/core/route/savat_route.dart';
import 'package:singelton_dars/features/home/bottom_item.dart';
import 'package:singelton_dars/features/home/destination_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BottomItem> ls = [ 
    BottomItem(icon: AppIcons.asosiy, label: "Asosiy"),
    BottomItem(icon: AppIcons.katalog, label: "Katalog"),
    BottomItem(icon: AppIcons.zakaz, label: "Buyurtmalar"),
    BottomItem(icon: AppIcons.savat, label: "Savatcha"),
    BottomItem(icon: AppIcons.profile, label: "Profil"),

  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: index,
              children: const [
                DestinationPage(onGenerateRoute: AsosiyRoute.onGenerateRoute),
                DestinationPage(onGenerateRoute: KatalogRoute.onGenerateRoute),
                DestinationPage(
                    onGenerateRoute: BuyurmalarRoute.onGenerateRoute),
                DestinationPage(onGenerateRoute: SavatRoute.onGenerateRoute),
                DestinationPage(onGenerateRoute: ProfileRoute.onGenerateRoute),
              ],
            ),
          ),
          
        ],
      ),
      bottomNavigationBar: BottomAppBar( 
        elevation: 0,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
            (index) {
              return GestureDetector( 
                onTap: () {
                  this.index = index;
                  setState(() {
                    
                  });
                },
                child: Column(
                  children: [ 
                    SvgPicture.asset(ls[index].icon), 
                    const Gap(4), 
                    Text(ls[index].label, style: const TextStyle( 
                      color: grey, 
                      fontSize: 11, 
                      fontWeight: FontWeight.w500,
                    ),),
                  ]
                ),
              );
            },
          ),
        ),
       ),
    );
  }
}
