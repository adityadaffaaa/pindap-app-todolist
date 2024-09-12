import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/calendar_task/controllers/calendar_task_controller.dart';
import 'package:pindap_todolist/app/modules/home/controllers/home_controller.dart';
import 'package:pindap_todolist/app/modules/main_screen/controllers/bottom_navbar_app_controller.dart';
import 'package:pindap_todolist/app/modules/my_task/controllers/my_task_controller.dart';
import 'package:pindap_todolist/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(
      MainScreenController.new,
    );
    Get.lazyPut<HomeController>(
      HomeController.new,
    );
    Get.lazyPut<CalendarTaskController>(
      CalendarTaskController.new,
    );
    Get.lazyPut<MyTaskController>(
      MyTaskController.new,
    );
    Get.lazyPut<ProfileController>(
      ProfileController.new,
    );
    Get.lazyPut<BottomNavbarAppController>(
      BottomNavbarAppController.new,
    );
  }
}
