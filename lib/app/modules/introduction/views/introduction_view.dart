import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pindap_todolist/app/routes/app_pages.dart';
import 'package:pindap_todolist/app/widgets/app_button.dart';
import 'package:pindap_todolist/app/widgets/main_layout.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_images.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:iconly/iconly.dart';
import 'package:pindap_todolist/utils/constants.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});
  @override
  Widget build(final BuildContext context) => Scaffold(
        body: MainLayout(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    AppImages.img_intro,
                    width: Get.width / 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: Constants.basePadding,
                    left: Constants.basePadding,
                    bottom: Constants.basePadding,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Task Management & To-Do List',
                        style: AppTypography.heading2.copyWith(
                          color: AppColors.neutral800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!',
                        textAlign: TextAlign.center,
                        style: AppTypography.paragraph4.copyWith(
                          color: AppColors.neutral400,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      AppButton(
                        title: "Let's Start",
                        icon: IconlyBold.arrow_right,
                        onPress: () {
                          Get.offNamed<void>(
                            AppPages.AUTH,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
