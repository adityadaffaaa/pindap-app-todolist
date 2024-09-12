import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/home/views/sections/in_progress_section.dart';
import 'package:pindap_todolist/app/modules/home/views/sections/task_group_section.dart';
import 'package:pindap_todolist/app/modules/home/views/widgets/main_progress_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(final BuildContext context) => ListView(
        children: <Widget>[
          MainProgressCard(),
          InProgressSection(),
          TaskGroupSection(),
        ],
      );
}
