import 'dart:io';

import 'package:pindap_todolist/app/api/dio.dart';
import 'package:pindap_todolist/app/data/models/response/task_data_response.dart';
import 'package:pindap_todolist/utils/type.dart';

class TaskService {
  final ApiDio provider = ApiDio();

  Future<TaskResponse?> addTask(
    final TaskResponse taskData,
  ) async {
    final dynamic response = await provider.post(
      '/task',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      formData: taskData.toJsonTaskProcess(),
    );

    return TaskResponse.fromJson(response as JSON);
  }

  Future<List<TaskResponse>> getTask() async {
    List<TaskResponse> data = <TaskResponse>[];
    final dynamic response = await provider.get(
      '/task',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
    );
    for (dynamic res in response as List<dynamic>) {
      data.add(TaskResponse.fromJson(res as JSON));
    }
    return data;
  }

  Future<TaskResponse> getTaskWithId(
    final String id,
  ) async {
    final dynamic response = await provider.get(
      '/task/$id',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
    );
    return TaskResponse.fromJson(response as JSON);
  }

  Future<TaskResponse?> editTask(
    final String id, {
    required final TaskResponse taskData,
  }) async {
    final dynamic response = await provider.put(
      '/task/$id',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      formData: taskData.toJsonTaskProcess(),
    );

    return TaskResponse.fromJson(response as JSON);
  }

  Future<TaskResponse?> deleteTask(
    final String id,
  ) async {
    final dynamic response = await provider.delete(
      '/task/$id',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
    );

    return TaskResponse.fromJson(response as JSON);
  }
}
