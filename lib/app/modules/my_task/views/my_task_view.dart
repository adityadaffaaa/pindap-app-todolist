import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/my_task/controllers/my_task_controller.dart';
import 'package:pindap_todolist/app/widgets/task_card.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class MyTaskView extends GetView<MyTaskController> {
  const MyTaskView({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => controller.isLoadingVal
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blueMariner500,
                ),
              )
            : controller.taskData.isEmpty
                ? Center(
                    child: Text(
                      'Task is empty!',
                      style: AppTypography.paragraph1.copyWith(
                        color: AppColors.blueMariner500,
                      ),
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (final _, final int index) =>
                        const SizedBox(
                      height: 16,
                    ),
                    itemCount: controller.taskData.length,
                    controller: controller.scrollController,
                    itemBuilder: (final _, final int index) => Padding(
                      padding: EdgeInsets.only(
                        bottom:
                            index == controller.taskData.length - 1 ? 32 : 0,
                        right: Constants.basePadding,
                        left: Constants.basePadding,
                      ),
                      child: TaskCard(
                        data: controller.taskData[index],
                      ),
                    ),
                  ),
      );
}
