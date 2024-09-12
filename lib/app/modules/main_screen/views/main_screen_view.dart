import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/main_screen/controllers/bottom_navbar_app_controller.dart';
import 'package:pindap_todolist/app/modules/main_screen/views/widgets/floating_add_button.dart';
import 'package:pindap_todolist/app/routes/app_pages.dart';
import 'package:pindap_todolist/app/widgets/bottom_navbar_app.dart';
import 'package:pindap_todolist/app/widgets/custom_app_bar.dart';
import 'package:pindap_todolist/app/widgets/main_layout.dart';

import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({super.key});
  @override
  Widget build(final BuildContext context) {
    final BottomNavbarAppController bottomNavBarCtrl =
        Get.find<BottomNavbarAppController>();

    return MainLayout(
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.transparent,
          appBar: controller.isLoading.value
              ? AppBar()
              : CustomAppBar(
                  email: controller.user.email,
                ),
          body: bottomNavBarCtrl.pages[bottomNavBarCtrl.idx].page,
          floatingActionButton: FloatingAddButton(
            onPressed: () async {
              final dynamic data = await Get.toNamed<dynamic>(
                Routes.ADD_TASK,
              );
              if (data == true) controller.onChange();
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomNavbarApp(),
        ),
      ),
    );
  }
}
