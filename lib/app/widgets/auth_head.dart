import 'package:flutter/material.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';

class AuthHead extends StatelessWidget {
  const AuthHead({
    super.key,
    required this.title,
    required this.desc,
  });
  final String title, desc;
  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          Text(
            title,
            style: AppTypography.heading1.copyWith(
              color: AppColors.blueMariner500,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            desc,
            style: AppTypography.paragraph4.copyWith(
              color: AppColors.neutral400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
