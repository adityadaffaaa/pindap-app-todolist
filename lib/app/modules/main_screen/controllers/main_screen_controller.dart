import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/models/response/user_data_response.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';

class MainScreenController extends GetxController {
  RxBool isRefresh = RxBool(false);
  RxBool isLoading = RxBool(true);
  final Logger logger = Logger();

  late UserDataResponse user;

  Future<void> getUser() async {
    try {
      final UserDataResponse? userData =
          await AppExtensions.getUserFromLocalStorage();

      if (userData != null) user = userData;
    } catch (e) {
      logger.e('Get user failed: $e');
      throw Exception('Get user failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void onChange() {
    isRefresh.value = !isRefresh.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    logger.close();
    super.onClose();
  }
}
