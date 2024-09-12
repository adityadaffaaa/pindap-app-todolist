import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:pindap_todolist/app/data/models/others/bottom_nav_page_item.dart';
import 'package:pindap_todolist/app/modules/calendar_task/views/calendar_task_view.dart';
import 'package:pindap_todolist/app/modules/home/views/home_view.dart';
import 'package:pindap_todolist/app/modules/my_task/views/my_task_view.dart';
import 'package:pindap_todolist/app/modules/profile/views/profile_view.dart';

class BottomNavbarAppController extends GetxController {
  final RxInt _currentIdx = RxInt(0);

  final List<BottomNavPageItem> pages = <BottomNavPageItem>[
    BottomNavPageItem(
      title: 'Home',
      icon: const Icon(
        IconsaxPlusLinear.home,
      ),
      activeIcon: const Icon(
        IconsaxPlusBold.home,
      ),
      page: const HomeView(),
    ),
    BottomNavPageItem(
      title: 'My Task',
      icon: const Icon(
        IconsaxPlusLinear.task,
      ),
      activeIcon: const Icon(
        IconsaxPlusBold.task,
      ),
      page: const MyTaskView(),
    ),
    BottomNavPageItem(
      title: 'Calendar',
      icon: const Icon(
        IconsaxPlusLinear.calendar,
      ),
      activeIcon: const Icon(
        IconsaxPlusBold.calendar,
      ),
      page: const CalendarTaskView(),
    ),
    BottomNavPageItem(
      title: 'Profile',
      icon: const Icon(
        IconsaxPlusLinear.profile,
      ),
      activeIcon: const Icon(
        IconsaxPlusBold.profile,
      ),
      page: const ProfileView(),
    ),
  ];

  int get idx => _currentIdx.value;

  void onChange(final int idx) => _currentIdx.value = idx;
}
