import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:singelton_dars/assets/colors/color.dart';
import 'package:singelton_dars/assets/widgets/icons.dart';

Future<dynamic> selectLanguage(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: white,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 4,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Ilova tilini o‘zgartish",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppIcons.orqagaTilTanlash),
                ),
              ],
            ),
            const Gap(16),
            const Divider(),
            const Gap(16),
            ...List.generate(
              3,
              (index) {
                return Container(
                  margin: EdgeInsets.only(bottom: index == 2 ? 20 : 12),
                  height: 60,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    left: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF9DD),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        index < 2 ? AppIcons.flag_uzb : AppIcons.flagRus,
                      ),
                      const Gap(9),
                      Text(
                        title[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: textBlack,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                child: Text(
                  'Tasdiqlash',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

List<String> title = [
  "O‘zbekcha",
  'Ўзбекча',
  'Русский',
];
