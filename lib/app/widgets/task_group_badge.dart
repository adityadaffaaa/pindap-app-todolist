import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:pindap_todolist/app/enums/task_group_enum.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/constants.dart';

class TaskGroupBadge extends StatelessWidget {
  const TaskGroupBadge({
    super.key,
    required this.taskGroupType,
  });

  final TaskGroupEnum taskGroupType;

  @override
  Widget build(final BuildContext context) {
    final List<Color> bgColor = <Color>[
      AppColors.officeProjectColor,
      AppColors.personalProjectColor,
      AppColors.dailyStudyColor,
    ];

    final List<IconData> icon = <IconData>[
      IconsaxPlusBold.briefcase,
      IconsaxPlusBold.user_octagon,
      IconsaxPlusBold.book_1,
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor[taskGroupType.value - 1].withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          Constants.baseCardRadius,
        ),
      ),
      child: Icon(
        icon[taskGroupType.value - 1],
        color: bgColor[taskGroupType.value - 1],
      ),
    );
  }

  static Widget get officeProject => const TaskGroupBadge(
        taskGroupType: TaskGroupEnum.OFFICE_PROJECT,
      );

  static Widget get personalProject => const TaskGroupBadge(
        taskGroupType: TaskGroupEnum.PERSONAL_PROJECT,
      );

  static Widget get dailyStudy => const TaskGroupBadge(
        taskGroupType: TaskGroupEnum.DAILY_STUDY,
      );
}
