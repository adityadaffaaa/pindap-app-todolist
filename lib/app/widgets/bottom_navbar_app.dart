import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/data/models/others/bottom_nav_page_item.dart';
import 'package:pindap_todolist/app/modules/main_screen/controllers/bottom_navbar_app_controller.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class BottomNavbarApp extends StatelessWidget {
  const BottomNavbarApp({super.key});

  @override
  Widget build(final BuildContext context) => GetX<BottomNavbarAppController>(
        builder: (final BottomNavbarAppController ctrl) => ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(
              Constants.baseRadius,
            ),
          ),
          child: BottomAppBar(
            padding: EdgeInsets.zero,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6,
            height: Get.height / 100 * 8,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              backgroundColor: AppColors.blueMariner100,
              currentIndex: ctrl.idx,
              type: BottomNavigationBarType.fixed,
              unselectedIconTheme: const IconThemeData(
                color: AppColors.blueMariner400,
              ),
              unselectedLabelStyle: AppTypography.paragraph4.copyWith(
                fontSize: 8,
              ),
              selectedLabelStyle: AppTypography.paragraph4.copyWith(
                fontSize: 8,
              ),
              selectedItemColor: AppColors.blueMariner500,
              unselectedItemColor: AppColors.blueMariner400,
              onTap: ctrl.onChange,
              items: ctrl.pages
                  .map(
                    (final BottomNavPageItem item) => BottomNavigationBarItem(
                      icon: item.icon,
                      label: '',
                      activeIcon: item.activeIcon,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}
