import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/main_screen/controllers/bottom_navbar_app_controller.dart';
import 'package:pindap_todolist/app/widgets/app_button.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MainProgressCard extends StatelessWidget {
  const MainProgressCard({super.key});

  @override
  Widget build(final BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: Constants.basePadding),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Constants.baseCardRadius,
          ),
          color: AppColors.blueMariner500,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Your task,\n almost done!",
                  style:
                      AppTypography.paragraph4.copyWith(color: AppColors.white),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: 120,
                  child: AppButton(
                    title: 'View Task',
                    bgColor: AppColors.white,
                    textColor: AppColors.blueMariner500,
                    textStyle: AppTypography.paragraph5,
                    onPress: () {
                      Get.find<BottomNavbarAppController>().onChange(1);
                    },
                  ),
                ),
              ],
            ),
            CircularPercentIndicator(
              radius: 50,
              lineWidth: 10,
              percent: 0.7,
              center: Text(
                '70%',
                style: AppTypography.heading4.copyWith(color: AppColors.white),
              ),
              progressColor: AppColors.white,
              backgroundColor: AppColors.white.withOpacity(0.4),
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      );
}
