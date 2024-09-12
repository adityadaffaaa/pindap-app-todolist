import 'package:flutter/material.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.icon,
    this.bgColor = AppColors.blueMariner500,
    this.textColor = AppColors.white,
    this.iconColor = AppColors.white,
    this.textStyle,
    this.onPress,
  });

  final String title;
  final IconData? icon;
  final Color bgColor, textColor, iconColor;
  final TextStyle? textStyle;
  final VoidCallback? onPress;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(bgColor),
          iconColor: WidgetStateProperty.all<Color>(iconColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Constants.baseCardRadius,
              ),
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: textStyle ??
                    AppTypography.heading4.copyWith(
                      color: textColor,
                    ),
              ),
            ),
            icon != null ? Icon(icon) : const SizedBox(),
          ],
        ),
      );
}
