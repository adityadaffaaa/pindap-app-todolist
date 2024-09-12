import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/models/response/user_data_response.dart';
import 'package:pindap_todolist/app/data/services/auth_service.dart';
import 'package:pindap_todolist/app/enums/auth_field_enum.dart';
import 'package:pindap_todolist/app/enums/auth_input_enum.dart';
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

  bool formValidate() => emailTec.value.text != '' && passwordTec.text != '';

  Future<void> signIn() async {
    try {
      final bool valResult = formValidate();
      if (valResult) {
        final User? result = await authService.signIn(
          email: emailTec.value.text,
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

  void handleDataToLocalStorage() {
    emailTec.addListener(
      () async {
        await AppExtensions.setTemporaryDataAuth(
          emailTec.text,
          type: AuthInputEnum.SIGN_IN,
          fieldType: AuthFieldEnum.EMAIL,
        );
      },
    );
    passwordTec.addListener(
      () async {
        await AppExtensions.setTemporaryDataAuth(
          passwordTec.text,
          type: AuthInputEnum.SIGN_IN,
          fieldType: AuthFieldEnum.PASSWORD,
        );
      },
    );
  }

  Future<void> loadDataFromLocalStorage() async {
    final String? emailData = await AppExtensions.getTemporaryDataAuth(
      type: AuthInputEnum.SIGN_IN,
      fieldType: AuthFieldEnum.EMAIL,
    );
    final String? passwordData = await AppExtensions.getTemporaryDataAuth(
      type: AuthInputEnum.SIGN_IN,
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
