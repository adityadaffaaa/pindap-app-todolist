import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/data/models/others/task_group_item.dart';
import 'package:pindap_todolist/app/data/models/others/task_status_item.dart';
import 'package:pindap_todolist/app/data/models/response/task_data_response.dart';
import 'package:pindap_todolist/app/data/services/task_service.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';
import 'package:pindap_todolist/utils/constants.dart';
import 'package:pindap_todolist/utils/type.dart';

class EditTaskController extends GetxController {
  late TaskResponse taskDataExist;

  final TextEditingController taskNameTec = TextEditingController();
  final TextEditingController descTec = TextEditingController();
  final GlobalKey<FormState> forms = GlobalKey<FormState>();
  final RxInt valTaskGroup = RxInt(1);
  final RxInt valTaskStatus = RxInt(1);

  final Logger logger = Logger();
  final TaskService taskService = TaskService();

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
  int get taskGroup => valTaskGroup.value;
  int get taskStatus => valTaskStatus.value;

  void changeTaskGroup(final int val) => valTaskGroup.value = val;

  void changeTaskStatus(final int val) => valTaskStatus.value = val;

  void handleDataArgs() {
    final TaskResponse data = Get.arguments as TaskResponse;

    taskDataExist = data;
    valTaskGroup.value = int.parse(data.taskGroup);
    valTaskStatus.value = int.parse(data.status);
    taskNameTec.text = data.title;
    descTec.text = data.desc;
  }

  bool formValidate() => taskNameTec.text != '' && descTec.text != '';

  Future<void> editTask() async {
    try {
      final bool valResult = formValidate() && forms.currentState!.validate();

      if (!valResult) return;

      final TaskResponse taskData = TaskResponse(
        userId: taskDataExist.userId,
        email: taskDataExist.email,
        title: taskNameTec.text,
        desc: descTec.text,
        taskGroup: valTaskGroup.value.toString(),
        createdAt: taskDataExist.createdAt,
        updatedAt: AppExtensions.getCurrentFormattedDate(),
        status: valTaskStatus.value.toString(),
      );

      final TaskResponse? result = await taskService.editTask(
        taskDataExist.id!,
        taskData: taskData,
      );

      if (result != null) {
        taskNameTec.clear();
        descTec.clear();

        Get.back(result: true);
      }
    } catch (e) {
      logger.e('Edit task error: $e');
      throw Exception('Edit task error: $e');
    }
  }

  Future<void> deleteTask() async {
    try {
      final TaskResponse? result = await taskService.deleteTask(
        taskDataExist.id!,
      );

      if (result != null) {
        Get.back(result: true);
      }
    } catch (e) {
      logger.e('Delete task error: $e');
      throw Exception('Delete task error: $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    handleDataArgs();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    taskGroupItems.clear();
    taskStatusItems.clear();

    super.onClose();
  }
}
