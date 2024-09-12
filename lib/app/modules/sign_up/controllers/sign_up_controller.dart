import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/services/auth_service.dart';
import 'package:pindap_todolist/app/enums/auth_field_enum.dart';
import 'package:pindap_todolist/app/enums/auth_input_enum.dart';
import 'package:pindap_todolist/app/routes/app_pages.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';

class SignUpController extends GetxController {
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

  void handleDataToLocalStorage() {
    emailTec.addListener(
      () async {
        await AppExtensions.setTemporaryDataAuth(
          emailTec.text,
          type: AuthInputEnum.SIGN_UP,
          fieldType: AuthFieldEnum.EMAIL,
        );
      },
    );
    passwordTec.addListener(
      () async {
        await AppExtensions.setTemporaryDataAuth(
          passwordTec.text,
          type: AuthInputEnum.SIGN_UP,
          fieldType: AuthFieldEnum.PASSWORD,
        );
      },
    );
  }

  Future<void> loadDataFromLocalStorage() async {
    final String? emailData = await AppExtensions.getTemporaryDataAuth(
      type: AuthInputEnum.SIGN_UP,
      fieldType: AuthFieldEnum.EMAIL,
    );
    final String? passwordData = await AppExtensions.getTemporaryDataAuth(
      type: AuthInputEnum.SIGN_UP,
      fieldType: AuthFieldEnum.PASSWORD,
    );

    if (emailData != null) emailTec.text = emailData;
    if (passwordData != null) passwordTec.text = passwordData;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    loadDataFromLocalStorage();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    handleDataToLocalStorage();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    logger.close();
    isObscure.close();
    super.onClose();
  }
}
