import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';

class CalendarTaskView extends GetView<CalendarTaskView> {
  const CalendarTaskView({super.key});

  @override
  Widget build(final BuildContext context) => Center(
        child: Text(
          'Calendar page',
          style: AppTypography.paragraph1.copyWith(
            color: AppColors.blueMariner500,
          ),
        ),
      );
}
