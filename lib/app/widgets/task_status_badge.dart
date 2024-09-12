import 'package:flutter/material.dart';
import 'package:pindap_todolist/app/enums/task_status_enum.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class TaskStatusBadge extends StatelessWidget {
  const TaskStatusBadge({
    super.key,
    required this.taskStatusType,
  });

  final TaskStatusEnum taskStatusType;

  @override
  Widget build(final BuildContext context) {
    final List<Color> color = <Color>[
      AppColors.blueMariner500,
      AppColors.dailyStudyColor,
      AppColors.personalProjectColor,
    ];

    final List<String> labelText = <String>[
      'To do',
      'In Progress',
      'Done',
    ];

    return Chip(
      label: Text(
        labelText[taskStatusType.value - 1],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.infinite),
      ),
      labelStyle: AppTypography.paragraph5.copyWith(
        color: color[taskStatusType.value - 1],
        fontWeight: FontWeight.w400,
      ),
      backgroundColor: color[taskStatusType.value - 1].withOpacity(0.1),
      side: BorderSide.none,
    );
  }

  static Widget get todo => const TaskStatusBadge(
        taskStatusType: TaskStatusEnum.TODO,
      );

  static Widget get inProgress => const TaskStatusBadge(
        taskStatusType: TaskStatusEnum.IN_PROGRESS,
      );

  static Widget get done => const TaskStatusBadge(
        taskStatusType: TaskStatusEnum.DONE,
      );
}
