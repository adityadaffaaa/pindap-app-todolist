import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/edit_task/views/sections/edit_task_body_section.dart';
import 'package:pindap_todolist/app/widgets/app_button.dart';
import 'package:pindap_todolist/app/widgets/main_layout.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

import '../controllers/edit_task_controller.dart';

class EditTaskView extends GetView<EditTaskController> {
  const EditTaskView({super.key});
  @override
  Widget build(final BuildContext context) => MainLayout(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Edit Task',
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
          body: const EditTaskBodySection(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              bottom: Constants.baseGapPerSection,
              left: Constants.basePadding,
              right: Constants.basePadding,
            ),
            child: AppButton(
              title: 'Edit Project',
              onPress: () {
                controller.editTask();
              },
            ),
          ),
        ),
      );
}
