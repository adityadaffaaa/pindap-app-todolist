import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/home/controllers/home_controller.dart';
import 'package:pindap_todolist/app/modules/home/views/widgets/section_title.dart';
import 'package:pindap_todolist/app/modules/home/views/widgets/task_group_card.dart';

import 'package:pindap_todolist/utils/constants.dart';

class TaskGroupSection extends GetView<HomeController> {
  const TaskGroupSection({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          children: <Widget>[
            const SectionTitle(
              title: 'Task Groups',
            ),
            const SizedBox(
              height: Constants.baseGap,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Constants.basePadding),
              child: ListView.separated(
                separatorBuilder: (final _, final int index) => const SizedBox(
                  height: 16,
                ),
                shrinkWrap: true,
                controller: controller.scrollController,
                itemCount: 3,
                itemBuilder: (final _, final int index) => TaskGroupCard(
                  taskType: index + 1,
                ),
              ),
            ),
          ],
        ),
      );
}
