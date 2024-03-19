import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:singelton_dars/assets/colors/color.dart';
import 'package:singelton_dars/assets/widgets/icons.dart';
import 'package:singelton_dars/core/route_names/app_route_names.dart';
import 'package:singelton_dars/features/authenfication/presentation/pages/one_page.dart';
import 'package:singelton_dars/features/authenfication/presentation/pages/page_three.dart';
import 'package:singelton_dars/features/authenfication/presentation/pages/page_two.dart';
import 'package:singelton_dars/features/authenfication/presentation/pages/select_language.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                selectLanguage(context);
              },
              child: Expanded(
                child: Container(
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.flag_uzb),
                      const Gap(8),
                      Text(
                        "O‘zbekcha",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              color: textBlack,
                            ),
                      ),
                      const Gap(7),
                      SvgPicture.asset(AppIcons.bottom_arrow),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector( 
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(AppRouteNames.home, (route) => false);
              },
              child: Container(
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  right: 8,
                  left: 19,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: textFieldNoFocusBackgound,
                ),
                child: Row(
                  children: [
                    Text(
                      "O‘tkazib yuborish",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            color: textFieldFocusBorderColor,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SvgPicture.asset(AppIcons.otkazish),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: controller,
        children: const [
          PageOne(),
          PageTwo(),
          PageThree(),
        ],
      ),
      
    );
  }
}
