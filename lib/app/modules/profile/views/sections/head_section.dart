import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/my_task/controllers/my_task_controller.dart';
import 'package:pindap_todolist/app/modules/profile/controllers/profile_controller.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';

class HeadSection extends GetView<ProfileController> {
  const HeadSection({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => controller.isLoadingVal
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blueMariner500,
                ),
              )
            : Column(
                children: <Widget>[
                  Text(
                    controller.userData.email,
                    style: AppTypography.heading3
                        .copyWith(color: AppColors.neutral900),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        Get.find<MyTaskController>().taskData.length.toString(),
                        style: AppTypography.heading4
                            .copyWith(color: AppColors.neutral900),
                      ),
                      Text(
                        'Task',
                        style: AppTypography.paragraph4
                            .copyWith(color: AppColors.neutral600),
                      ),
                    ],
                  ),
                ],
              ),
      );
}
