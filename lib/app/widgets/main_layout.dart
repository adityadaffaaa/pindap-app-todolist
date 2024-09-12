import 'package:flutter/material.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_images.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, this.child});

  final Widget? child;

  @override
  Widget build(final BuildContext context) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.img_bg_colorful,
            ),
          ),
        ),
        child: child,
      );
}
