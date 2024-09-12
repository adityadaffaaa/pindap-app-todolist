import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/services/auth_service.dart';
import 'package:pindap_todolist/app/routes/app_pages.dart';
import 'package:pindap_todolist/utils/app_colors.dart';

class SignUpController extends GetxController {
  final TextEditingController nameTec = TextEditingController();
  final TextEditingController userNameTec = TextEditingController();
  final TextEditingController emailTec = TextEditingController();
  final TextEditingController passwordTec = TextEditingController();

  final AuthService authService = AuthService();
  final RxBool isObscure = RxBool(false);
  final Logger logger = Logger();

  bool get isObscureText => isObscure.value;

  void obscureTextChange(final bool value) => isObscure.value = !value;

  bool formValidate() => emailTec.text != '' && passwordTec.text != '';

  Future<void> signUp() async {
    try {
      final bool valResult = formValidate();
      if (valResult) {
        final bool result = await authService.signUp(
          email: emailTec.text,
          password: passwordTec.text,
        );

        if (result) {
          emailTec.clear();
          passwordTec.clear();

          Get.snackbar(
            'Success',
            'Register success and then sign in',
            backgroundColor: Colors.green,
            colorText: AppColors.white,
          );
          await Get.offNamed<void>(
            Routes.SIGN_IN,
          );
        }
      }
    } catch (e) {
      logger.e('Sign up controller error: $e');
      throw Exception('Sign up controller error: $e');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameTec.clear();
    userNameTec.clear();
    emailTec.clear();
    passwordTec.clear();
    logger.close();
    isObscure.close();
    super.onClose();
  }
}
