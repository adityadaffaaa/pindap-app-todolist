import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:pindap_todolist/app/data/models/others/task_group_item.dart';
import 'package:pindap_todolist/app/data/models/others/task_status_item.dart';
import 'package:pindap_todolist/app/enums/task_process_enum.dart';
import 'package:pindap_todolist/app/widgets/app_button.dart';
import 'package:pindap_todolist/app/widgets/dropdown_item.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/constants.dart';

class TaskProcessLayout extends GetView<dynamic> {
  const TaskProcessLayout({
    super.key,
    required this.taskGroupItems,
    required this.taskStatusItems,
    this.taskProcessType = TaskProcessEnum.ADD,
  });

  final List<TaskGroupItem> taskGroupItems;
  final List<TaskStatusItem> taskStatusItems;
  final TaskProcessEnum taskProcessType;

  @override
  Widget build(final BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(
        Constants.baseCardRadius,
      ),
    );

    const EdgeInsets contentPadding = EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 18,
    );

    return Padding(
      padding: const EdgeInsets.all(
        Constants.basePadding,
      ),
      child: ListView(
        children: <Widget>[
          DropdownButtonFormField<int>(
            isExpanded: true,
            decoration: InputDecoration(
              labelText: 'Task group',
              focusedBorder: outlineInputBorder,
              border: outlineInputBorder,
              fillColor: AppColors.white,
              contentPadding: contentPadding,
            ),
            value: 1,
            items: taskGroupItems
                .map(
                  (final TaskGroupItem e) => DropdownMenuItem<int>(
                    value: e.type,
                    child: DropdownItem(item: e),
                  ),
                )
                .toList(),
            onChanged: (final Object? value) {},
          ),
          const SizedBox(
            height: Constants.baseGap,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Task name',
              focusedBorder: outlineInputBorder,
              border: outlineInputBorder,
              fillColor: AppColors.white,
              contentPadding: contentPadding,
            ),
          ),
          const SizedBox(
            height: Constants.baseGap,
          ),
          TextFormField(
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Description',
              focusedBorder: outlineInputBorder,
              border: outlineInputBorder,
              fillColor: AppColors.white,
              contentPadding: contentPadding,
            ),
          ),
          const SizedBox(
            height: Constants.baseGap,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'DD/MM/YYYY',
                    focusedBorder: outlineInputBorder,
                    border: outlineInputBorder,
                    fillColor: AppColors.white,
                    contentPadding: contentPadding,
                  ),
                ),
              ),
              const SizedBox(
                width: Constants.baseGap,
              ),
              IconButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                },
                icon: const Icon(
                  IconlyBold.calendar,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Constants.baseGap,
          ),
          if (taskProcessType == TaskProcessEnum.EDIT) ...<Widget>[
            DropdownButtonFormField<int>(
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Task Status',
                focusedBorder: outlineInputBorder,
                border: outlineInputBorder,
                fillColor: AppColors.white,
                contentPadding: contentPadding,
              ),
              value: 1,
              items: taskStatusItems
                  .map(
                    (final TaskStatusItem e) => DropdownMenuItem<int>(
                      value: e.type,
                      child: Text(e.title),
                    ),
                  )
                  .toList(),
              onChanged: (final Object? value) {},
            ),
            const SizedBox(
              height: Constants.baseGap,
            ),
            AppButton(
              title: 'Delete Task',
              bgColor: AppColors.dangerColor,
              icon: IconsaxPlusBold.trash,
              onPress: () {},
            ),
          ],
        ],
      ),
    );
  }

  static Widget add({
    required final List<TaskGroupItem> taskGroupItems,
    required final List<TaskStatusItem> taskStatusItems,
  }) =>
      TaskProcessLayout(
        taskGroupItems: taskGroupItems,
        taskStatusItems: taskStatusItems,
      );

  static Widget edit({
    required final List<TaskGroupItem> taskGroupItems,
    required final List<TaskStatusItem> taskStatusItems,
  }) =>
      TaskProcessLayout(
        taskGroupItems: taskGroupItems,
        taskStatusItems: taskStatusItems,
        taskProcessType: TaskProcessEnum.EDIT,
      );
}
