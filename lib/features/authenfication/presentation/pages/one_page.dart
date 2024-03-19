import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:singelton_dars/assets/colors/color.dart';
import 'package:singelton_dars/assets/widgets/icons.dart';
import 'package:singelton_dars/assets/widgets/images.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.onePage,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const Gap(20),
              Text(
                "10 000 dan ortiq \nmahsulotlar va qulay \ninterfeys",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                    ),
              ),
              const Gap(12),
              const Text(
                "iBaza ilovasida 10 000 dan ortiq mahsulotlar joy \nolgan",
                style: TextStyle(
                  fontSize: 14,
                  color: textBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}