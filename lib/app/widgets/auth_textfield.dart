import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({
    super.key,
    required this.hintText,
    required this.mainTec,
    this.isPassword = false,
    this.isObscure = false,
    this.onPressed,
  });

  final String hintText;
  final TextEditingController mainTec;
  final bool isPassword;
  final VoidCallback? onPressed;
  final bool isObscure;

  @override
  Widget build(final BuildContext context) => TextFormField(
        controller: mainTec,
        style: AppTypography.paragraph2.copyWith(
          color: AppColors.neutral950,
        ),
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTypography.paragraph2.copyWith(
            color: AppColors.neutral500,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.blueMariner500,
            ),
            borderRadius: BorderRadius.circular(
              Constants.baseCardRadius,
            ),
          ),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              Constants.baseCardRadius,
            ),
          ),
          fillColor: AppColors.blueMariner50,
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onPressed,
                  icon: isObscure
                      ? const Icon(
                          IconsaxPlusBold.eye_slash,
                        )
                      : const Icon(
                          IconsaxPlusBold.eye,
                        ),
                )
              : const SizedBox(),
        ),
      );

  static Widget normal({
    required final String hintText,
    required final TextEditingController mainTec,
  }) =>
      AuthTextfield(
        hintText: hintText,
        mainTec: mainTec,
      );

  static Widget password({
    required final String hintText,
    required final TextEditingController mainTec,
    required final VoidCallback onPressed,
    required final bool isObscure,
  }) =>
      AuthTextfield(
        hintText: hintText,
        mainTec: mainTec,
        isPassword: true,
        onPressed: onPressed,
        isObscure: isObscure,
      );
}
