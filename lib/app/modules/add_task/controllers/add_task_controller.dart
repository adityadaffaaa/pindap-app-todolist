import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/models/others/task_group_item.dart';
import 'package:pindap_todolist/app/data/models/others/task_status_item.dart';
import 'package:pindap_todolist/app/data/models/response/task_data_response.dart';
import 'package:pindap_todolist/app/data/models/response/user_data_response.dart';
import 'package:pindap_todolist/app/data/services/task_service.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';
import 'package:pindap_todolist/utils/constants.dart';
import 'package:pindap_todolist/utils/type.dart';

class AddTaskController extends GetxController {
  final TextEditingController taskNameTec = TextEditingController();
  final TextEditingController descTec = TextEditingController();
  final RxInt valTaskGroup = RxInt(1);
  final GlobalKey<FormState> forms = GlobalKey<FormState>();

  final TaskService taskService = TaskService();

  final Logger logger = Logger();

  final List<TaskGroupItem> taskGroupItems = Constants.taskGroup
      .map(
        (final JSON item) => TaskGroupItem(
          type: item['type'] as int,
          title: item['title'] as String,
          icon: item['icon'] as IconData,
          color: item['color'] as Color,
        ),
      )
      .toList();

  final List<TaskStatusItem> taskStatusItems = Constants.taskStatus
      .map(
        (final JSON item) => TaskStatusItem(
          type: item['type'] as int,
          title: item['title'] as String,
        ),
      )
      .toList();

  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(
      Constants.baseCardRadius,
    ),
  );

  bool formValidate() => taskNameTec.text != '' && descTec.text != '';

  int get taskGroup => valTaskGroup.value;

  Future<void> addTask() async {
    try {
      final bool valResult = formValidate() && forms.currentState!.validate();

      if (!valResult) return;

      final UserDataResponse? userData =
          await AppExtensions.getUserFromLocalStorage();

      if (userData == null) return;

      final TaskResponse taskData = TaskResponse(
        userId: userData.uid,
        email: userData.email,
        title: taskNameTec.text,
        desc: descTec.text,
        status: '1',
        createdAt: AppExtensions.getCurrentFormattedDate(),
        updatedAt: AppExtensions.getCurrentFormattedDate(),
        taskGroup: valTaskGroup.value.toString(),
      );

      final TaskResponse? result = await taskService.addTask(taskData);
      if (result != null) {
        taskNameTec.clear();
        descTec.clear();
        
        Get.back(result: true);
      }
    } catch (e) {
      logger.e('Add task error: $e');
      throw Exception('Add task error: $e');
    }
  }

  void changeTaskGroup(final int val) => valTaskGroup.value = val;

  @override
  void onClose() {
    // TODO: implement onClose
    taskGroupItems.clear();
    taskStatusItems.clear();
    taskNameTec.clear();
    descTec.clear();

    super.onClose();
  }
}
