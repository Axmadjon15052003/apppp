import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:singelton_dars/assets/colors/color.dart';
import 'package:singelton_dars/assets/widgets/images.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.threePage),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(28),
              Text(
                "Hoziroq ro‘yxatdan o‘ting!",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                    ),
              ),
              const Gap(12),
              const Text(
                "Ro‘yxatdan o‘tib, ilova imkoniyatlaridan to‘liq foydalaning",
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