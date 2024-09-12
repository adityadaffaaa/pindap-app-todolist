import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pindap_todolist/app/routes/app_pages.dart';
import 'package:pindap_todolist/app/widgets/app_button.dart';
import 'package:pindap_todolist/app/widgets/auth_head.dart';
import 'package:pindap_todolist/app/widgets/auth_textfield.dart';
import 'package:pindap_todolist/app/widgets/main_layout.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(final BuildContext context) => MainLayout(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.only(
                right: Constants.basePadding,
                left: Constants.basePadding,
                top: 52,
              ),
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    children: <Widget>[
                      const AuthHead(
                        title: 'Sign Up',
                        desc:
                            'This productive tool is designed to helpyou better manage your task',
                      ),
                      const SizedBox(
                        height: Constants.baseGapPerSection,
                      ),
                      // AuthTextfield.normal(
                      //   hintText: 'Name',
                      //   mainTec: controller.nameTec,
                      // ),
                      // const SizedBox(
                      //   height: Constants.baseGap,
                      // ),
                      // AuthTextfield.normal(
                      //   hintText: 'Username',
                      //   mainTec: controller.userNameTec,
                      // ),
                      const SizedBox(
                        height: Constants.baseGap,
                      ),
                      AuthTextfield.normal(
                        hintText: 'Email',
                        mainTec: controller.emailTec,
                      ),
                      const SizedBox(
                        height: Constants.baseGap,
                      ),
                      AuthTextfield.password(
                        hintText: 'Password',
                        mainTec: controller.passwordTec,
                        isObscure: controller.isObscureText,
                        onPressed: () => controller.obscureTextChange(
                          controller.isObscureText,
                        ),
                      ),
                      const SizedBox(
                        height: Constants.baseGap,
                      ),
                      AppButton(
                        title: 'Sign Up',
                        onPress: () {
                          controller.signUp();
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed<void>(
                            Routes.SIGN_IN,
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            style: AppTypography.paragraph4.copyWith(
                              color: AppColors.neutral500,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Do you have account?',
                              ),
                              TextSpan(
                                text: ' Sign In',
                                style: AppTypography.paragraph4.copyWith(
                                  color: AppColors.blueMariner500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
