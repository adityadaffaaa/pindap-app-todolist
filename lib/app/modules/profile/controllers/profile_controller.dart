import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/models/others/profile_setting_item.dart';
import 'package:pindap_todolist/app/data/models/response/user_data_response.dart';
import 'package:pindap_todolist/app/routes/app_pages.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';
import 'package:pindap_todolist/utils/constants.dart';
import 'package:pindap_todolist/utils/type.dart';

class ProfileController extends GetxController {
  final List<ProfileSettingItem> menus = Constants.settingMenus
      .map(
        (final JSON item) => ProfileSettingItem(
          title: item['title'] as String,
          icon: item['icon'] as IconData,
        ),
      )
      .toList();

  final Logger logger = Logger();
  final RxBool isLoading = RxBool(true);

  late UserDataResponse userData;

  bool get isLoadingVal => isLoading.value;

  Future<void> logout() async {
    try {
      final List<dynamic> results =
          await Future.wait<dynamic>(<Future<dynamic>>[
        FirebaseAuth.instance.signOut(),
        AppExtensions.removeUserFromLocalStorage(),
      ]);

      if (results.last as bool) await Get.offNamed<void>(AppPages.AUTH);
    } catch (e) {
      logger.e('Logout failed: $e');
      throw Exception('logout failed: $e');
    }
  }

  Future<void> getUserData() async {
    try {
      final UserDataResponse? result =
          await AppExtensions.getUserFromLocalStorage();

      userData = result!;
    } catch (e) {
      logger.e('Get user data failed: $e');
      throw Exception('Get user data failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUserData();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    logger.close();
    menus.clear();
    isLoading.close();
    super.onClose();
  }
}
