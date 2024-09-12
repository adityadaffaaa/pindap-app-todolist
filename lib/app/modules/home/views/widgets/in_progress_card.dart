import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class InProgressCard extends StatelessWidget {
  const InProgressCard({super.key});

  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: () {},
        child: Container(
          width: 250,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: AppColors.blueMariner100,
            borderRadius: BorderRadius.circular(
              Constants.baseCardRadius,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Grocery shopping app',
                      style: AppTypography.paragraph4.copyWith(
                        color: AppColors.neutral500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor:
                        AppColors.officeProjectColor.withOpacity(0.1),
                    child: const Icon(
                      IconsaxPlusBold.briefcase,
                      color: AppColors.officeProjectColor,
                    ),
                  ),
                ],
              ),
              Text(
                'Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor',
                style: AppTypography.paragraph2.copyWith(
                  color: AppColors.neutral900,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
}
