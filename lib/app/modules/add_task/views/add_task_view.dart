import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pindap_todolist/app/modules/add_task/views/sections/add_task_body_section.dart';
import 'package:pindap_todolist/app/widgets/app_button.dart';
import 'package:pindap_todolist/app/widgets/main_layout.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({super.key});
  @override
  Widget build(final BuildContext context) => MainLayout(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Add Task',
              style: AppTypography.heading4.copyWith(
                color: AppColors.neutral800,
              ),
            ),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Get.back<void>();
              },
              child: const Icon(
                IconlyBold.arrow_left,
              ),
            ),
            iconTheme: const IconThemeData(
              color: AppColors.neutral800,
            ),
          ),
          body: const AddTaskBodySection(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              bottom: Constants.baseGapPerSection,
              left: Constants.basePadding,
              right: Constants.basePadding,
            ),
            child: AppButton(
              title: 'Add Project',
              onPress: () {
                controller.addTask();
              },
            ),
          ),
        ),
      );
}
