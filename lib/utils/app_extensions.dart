import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/models/response/user_data_response.dart';
import 'package:pindap_todolist/utils/type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppExtensions {
  static Future<bool> firstTimeCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final bool? result = pref.getBool('isVisited');

    if (result == null || !result) {
      final bool res = await pref.setBool('isVisited', true);
      return res;
    }

    return false;
  }

  static Future<bool> setUserToLocalStorage(final UserDataResponse data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final bool result = await pref.setString(
      'userData',
      jsonEncode(data.toJson()),
    );
    Logger().i(result);
    return result;
  }

  static Future<UserDataResponse?> getUserFromLocalStorage() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final String? result = pref.getString(
        'userData',
      );

      Logger().i(result);

      if (result == null) return null;

      JSON userDataResult = jsonDecode(result) as JSON;

      return UserDataResponse.fromJson(userDataResult);
    } catch (e) {
      Logger().e('Get user from local storage error: $e');
      throw Exception('Get user from local storage error: $e');
    }
  }

  static Future<bool> removeUserFromLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final bool result = await pref.remove('userData');

    Logger().i(result);
    return result;
  }

  static Future<bool> hasConnection() async {
    final List<ConnectivityResult> connectivityResults =
        await Connectivity().checkConnectivity();

    return !connectivityResults.contains(ConnectivityResult.none);
  }

  static String formatDate(final String rawDate) {
    final DateTime date = DateFormat('dd-MM-yyyy').parse(rawDate);
    final String formattedDate = DateFormat('d MMMM, yyyy').format(date);
    return formattedDate;
  }

  static String getCurrentFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return formattedDate;
  }
}
