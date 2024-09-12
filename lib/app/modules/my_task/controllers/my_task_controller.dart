import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/models/response/task_data_response.dart';
import 'package:pindap_todolist/app/data/models/response/user_data_response.dart';
import 'package:pindap_todolist/app/data/services/task_service.dart';
import 'package:pindap_todolist/app/modules/main_screen/controllers/main_screen_controller.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';

class MyTaskController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final TaskService taskService = TaskService();
  final RxBool isLoading = RxBool(true);
  final Logger logger = Logger();

  RxList<TaskResponse> taskData = RxList<TaskResponse>(<TaskResponse>[]);

  bool get isLoadingVal => isLoading.value;

  Future<void> getTask() async {
    try {
      final UserDataResponse? userData =
          await AppExtensions.getUserFromLocalStorage();

      final List<TaskResponse> result = await taskService.getTask();
      if (result.isNotEmpty && userData != null) {
        final List<TaskResponse> finalRes = result
            .where((final TaskResponse e) => e.userId == userData.uid)
            .toList();

        taskData.assignAll(finalRes);
      }
    } catch (e) {
      logger.e('Get task failed: $e');
      throw Exception('Get task failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> handleChangeTask() async {
    Get.find<MainScreenController>().isRefresh.listen(
      (final bool val) async {
        Logger().f(val);
        await getTask();
        taskData.refresh();
        Get.snackbar(
          'Success',
          'Update task success',
          backgroundColor: Colors.green,
          colorText: AppColors.white,
        );
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getTask();

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady

    handleChangeTask();
    super.onReady();
  }

  @override
  void onClose() {
    logger.close();
    taskData.clear();
    // TODO: implement onClose
    super.onClose();
  }
}
