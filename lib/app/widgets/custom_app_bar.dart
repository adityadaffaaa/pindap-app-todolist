import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Size get preferredSize => Size(Get.width, Get.height / 100 * 7);

  @override
  PreferredSizeWidget build(final BuildContext context) => AppBar(
        backgroundColor: AppColors.white,
        shadowColor: AppColors.neutral900.withOpacity(0.1),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello!',
              style: AppTypography.paragraph4.copyWith(
                color: AppColors.neutral600,
              ),
            ),
            Text(
              email,
              style: AppTypography.paragraph1.copyWith(
                color: AppColors.neutral800,
              ),
            ),
          ],
        ),
      );
}
