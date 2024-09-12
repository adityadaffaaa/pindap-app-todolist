import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pindap_todolist/app/enums/task_group_enum.dart';
import 'package:pindap_todolist/app/widgets/task_group_badge.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class TaskGroupCard extends StatelessWidget {
  const TaskGroupCard({
    super.key,
    required this.taskType,
  });

  final int taskType;
  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: () {},
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  TaskGroupBadge(
                    taskGroupType: TaskGroupEnum.values.firstWhere(
                      (final TaskGroupEnum e) => e.value == taskType,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Office Project',
                        style: AppTypography.paragraph3
                            .copyWith(color: AppColors.neutral900),
                      ),
                      Text(
                        'Grocery shopping app',
                        style: AppTypography.paragraph4
                            .copyWith(color: AppColors.neutral500),
                      ),
                    ],
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: 30,
                lineWidth: 6,
                percent: 0.7,
                center: Text(
                  "70%",
                  style: AppTypography.paragraph3
                      .copyWith(color: AppColors.neutral900),
                ),
                progressColor: AppColors.officeProjectColor,
                backgroundColor: AppColors.officeProjectColor.withOpacity(0.4),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        ),
      );
}
