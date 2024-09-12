import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/home/controllers/home_controller.dart';
import 'package:pindap_todolist/app/modules/home/views/widgets/in_progress_card.dart';
import 'package:pindap_todolist/app/modules/home/views/widgets/section_title.dart';

import 'package:pindap_todolist/utils/constants.dart';

class InProgressSection extends GetView<HomeController> {
  const InProgressSection({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.baseGapPerSection,
        ),
        child: Column(
          children: <Widget>[
            const SectionTitle(
              title: 'In Progress',
              badge: 2,
            ),
            const SizedBox(
              height: Constants.baseGap,
            ),
            AspectRatio(
              aspectRatio: 16 / 4.5,
              child: ListView.separated(
                separatorBuilder: (final _, final int index) => const SizedBox(
                  width: 24,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (final BuildContext context, final int index) =>
                    Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 24 : 0,
                    right: index == 3 ? 24 : 0,
                  ),
                  child: InProgressCard(),
                ),
              ),
            ),
          ],
        ),
      );
}
