import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:pindap_todolist/app/data/models/response/task_data_response.dart';
import 'package:pindap_todolist/app/enums/task_group_enum.dart';
import 'package:pindap_todolist/app/enums/task_status_enum.dart';
import 'package:pindap_todolist/app/modules/main_screen/controllers/main_screen_controller.dart';
import 'package:pindap_todolist/app/routes/app_pages.dart';
import 'package:pindap_todolist/app/widgets/task_group_badge.dart';
import 'package:pindap_todolist/app/widgets/task_status_badge.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.data,
  });

  final TaskResponse data;
  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: () async {
          final dynamic result = await Get.toNamed<dynamic>(
            Routes.EDIT_TASK,
            arguments: data,
          );
          if (result == true) Get.find<MainScreenController>().onChange();
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              Constants.baseCardRadius,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.neutral950.withOpacity(0.1),
                blurRadius: 24,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    data.title,
                    style: AppTypography.paragraph4
                        .copyWith(color: AppColors.neutral500),
                  ),
                  TaskGroupBadge(
                    taskGroupType: TaskGroupEnum.values.firstWhere(
                      (final TaskGroupEnum e) =>
                          e.value == int.parse(data.taskGroup),
                    ),
                  ),
                ],
              ),
              Text(
                data.desc,
                style: AppTypography.paragraph1
                    .copyWith(color: AppColors.neutral900),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        IconsaxPlusBold.calendar,
                        color: AppColors.blueMariner500,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        AppExtensions.formatDate(data.updatedAt),
                        style: AppTypography.paragraph5.copyWith(
                          color: AppColors.blueMariner500,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  TaskStatusBadge(
                    taskStatusType: TaskStatusEnum.values.firstWhere(
                      (final TaskStatusEnum e) =>
                          e.value == int.parse(data.status),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
