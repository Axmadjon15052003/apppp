import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:singelton_dars/assets/colors/color.dart';
import 'package:singelton_dars/assets/widgets/images.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.twoPage),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(28),
              Text(
                "Maxsus chegirmalar!",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 24,
                    ),
              ),
              const Gap(12),
              const Text(
                "Ilova orqali maxsus chegirma va kuponlardan \nbaxramand bo‘ling!",
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
