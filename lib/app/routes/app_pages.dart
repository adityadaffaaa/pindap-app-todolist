import 'package:get/get.dart';

import '../modules/add_task/bindings/add_task_binding.dart';
import '../modules/add_task/views/add_task_view.dart';
import '../modules/edit_task/bindings/edit_task_binding.dart';
import '../modules/edit_task/views/edit_task_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/main_screen/bindings/main_screen_binding.dart';
import '../modules/main_screen/views/main_screen_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.MAIN_SCREEN;
  static const String INTRODUCTION = Routes.INTRODUCTION;
  static const String AUTH = Routes.SIGN_IN;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<List<GetPage<dynamic>>>(
      name: _Paths.INTRODUCTION,
      page: IntroductionView.new,
      binding: IntroductionBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<List<GetPage<dynamic>>>(
      name: _Paths.MAIN_SCREEN,
      page: () => const MainScreenView(),
      binding: MainScreenBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage<List<GetPage<dynamic>>>(
      name: _Paths.ADD_TASK,
      page: () => const AddTaskView(),
      binding: AddTaskBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<List<GetPage<dynamic>>>(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage<List<GetPage<dynamic>>>(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<List<GetPage<dynamic>>>(
      name: _Paths.EDIT_TASK,
      page: () => const EditTaskView(),
      binding: EditTaskBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
