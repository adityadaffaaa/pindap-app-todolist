import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/profile/controllers/profile_controller.dart';
import 'package:pindap_todolist/app/widgets/app_button.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class BodySection extends GetView<ProfileController> {
  const BodySection({super.key});

  @override
  Widget build(final BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(
            Constants.baseCardRadius,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.neutral950.withOpacity(0.2),
              blurRadius: 24,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(
          horizontal: Constants.basePadding,
          vertical: Constants.baseGapPerSection,
        ),
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemCount: controller.menus.length,
              shrinkWrap: true,
              itemBuilder: (final _, final int idx) => InkWell(
                onTap: () {},
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  leading: Text(
                    controller.menus[idx].title,
                    style: AppTypography.paragraph4.copyWith(
                      color: AppColors.neutral800,
                    ),
                  ),
                  trailing: Icon(
                    controller.menus[idx].icon,
                    color: AppColors.neutral800,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Constants.baseGap,
            ),
            AppButton(
              title: 'Logout',
              bgColor: AppColors.dangerColor,
              onPress: () => controller.logout(),
            ),
          ],
        ),
      );
}
