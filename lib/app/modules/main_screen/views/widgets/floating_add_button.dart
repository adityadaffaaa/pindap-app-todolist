import 'package:flutter/material.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/constants.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key, required this.onPressed,});
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Constants.infinite,
          ),
        ),
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: AppColors.blueMariner500,
          child: const Icon(
            Icons.add,
            color: AppColors.white,
            size: 38,
          ),
        ),
      );
}
