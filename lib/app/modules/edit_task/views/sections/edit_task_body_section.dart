import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/data/models/others/task_group_item.dart';
import 'package:pindap_todolist/app/data/models/others/task_status_item.dart';
import 'package:pindap_todolist/app/modules/edit_task/controllers/edit_task_controller.dart';
import 'package:pindap_todolist/app/widgets/app_button.dart';
import 'package:pindap_todolist/app/widgets/dropdown_item.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/constants.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class EditTaskBodySection extends GetView<EditTaskController> {
  const EditTaskBodySection({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(
          Constants.basePadding,
        ),
        child: Obx(
          () => Form(
            key: controller.forms,
            child: ListView(
              children: <Widget>[
                DropdownButtonFormField<int>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'Task group',
                    focusedBorder: controller.outlineInputBorder,
                    border: controller.outlineInputBorder,
                    fillColor: AppColors.white,
                    contentPadding: Constants.contentPadding,
                  ),
                  value: controller.taskGroup,
                  items: controller.taskGroupItems
                      .map(
                        (final TaskGroupItem e) => DropdownMenuItem<int>(
                          value: e.type,
                          child: DropdownItem(item: e),
                        ),
                      )
                      .toList(),
                  onChanged: (final int? value) {
                    controller.changeTaskGroup(value!);
                  },
                  validator: (final int? value) {
                    if (value == null) {
                      return "Task group is required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: Constants.baseGap,
                ),
                TextFormField(
                  controller: controller.taskNameTec,
                  decoration: InputDecoration(
                    labelText: 'Task name',
                    focusedBorder: controller.outlineInputBorder,
                    border: controller.outlineInputBorder,
                    fillColor: AppColors.white,
                    contentPadding: Constants.contentPadding,
                  ),
                  validator: (final String? value) {
                    if (value == null || value == '') {
                      return "Task name is required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: Constants.baseGap,
                ),
                TextFormField(
                  controller: controller.descTec,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    focusedBorder: controller.outlineInputBorder,
                    border: controller.outlineInputBorder,
                    fillColor: AppColors.white,
                    contentPadding: Constants.contentPadding,
                  ),
                  validator: (final String? value) {
                    if (value == null || value == '') {
                      return "Description is required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: Constants.baseGap,
                ),
                DropdownButtonFormField<int>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'Task Status',
                    focusedBorder: controller.outlineInputBorder,
                    border: controller.outlineInputBorder,
                    fillColor: AppColors.white,
                    contentPadding: Constants.contentPadding,
                  ),
                  value: controller.taskStatus,
                  items: controller.taskStatusItems
                      .map(
                        (final TaskStatusItem e) => DropdownMenuItem<int>(
                          value: e.type,
                          child: Text(e.title),
                        ),
                      )
                      .toList(),
                  onChanged: (final int? value) {
                    controller.changeTaskStatus(value!);
                  },
                  validator: (final int? value) {
                    if (value == null) {
                      return "Task status is required";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: Constants.baseGap,
                ),
                AppButton(
                  title: 'Delete Task',
                  bgColor: AppColors.dangerColor,
                  icon: IconsaxPlusBold.trash,
                  onPress: () {
                    controller.deleteTask();
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
