import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/models/response/user_data_response.dart';
import 'package:pindap_todolist/app/data/services/auth_service.dart';
import 'package:pindap_todolist/app/routes/app_pages.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';

class SignInController extends GetxController {
  final TextEditingController emailTec = TextEditingController();
  final TextEditingController passwordTec = TextEditingController();

  final AuthService authService = AuthService();
  final RxBool isObscure = RxBool(false);
  final Logger logger = Logger();

  bool get isObscureText => isObscure.value;

  void obscureTextChange(final bool value) => isObscure.value = !value;

  bool formValidate() => emailTec.text != '' && passwordTec.text != '';

  Future<void> signIn() async {
    try {
      final bool valResult = formValidate();
      if (valResult) {
        final User? result = await authService.signIn(
          email: emailTec.text,
          password: passwordTec.text,
        );

        if (result != null) {
          emailTec.clear();
          passwordTec.clear();
          final UserDataResponse userData = UserDataResponse(
            uid: result.uid,
            email: result.email!,
          );

          await AppExtensions.setUserToLocalStorage(userData);
          Get.snackbar(
            'Success',
            'Sign in success, and welcome to PinDap App 🙌',
            backgroundColor: Colors.green,
            colorText: AppColors.white,
          );
          await Get.offNamed<void>(
            Routes.MAIN_SCREEN,
          );
        }
      }
    } catch (e) {
      logger.e('Sign in controller error: $e');
      throw Exception('Sign in controller error: $e');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    emailTec.clear();
    passwordTec.clear();
    logger.close();
    isObscure.close();
    super.onClose();
  }
}
