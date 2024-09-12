import 'package:pindap_todolist/utils/type.dart';

class TaskResponse {
  final String userId;
  final String email;
  final String title;
  final String desc;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String? id;
  final String taskGroup;

  TaskResponse({
    required this.userId,
    required this.email,
    required this.title,
    required this.desc,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.taskGroup,
    this.id,
  });

  factory TaskResponse.fromJson(final JSON json) => TaskResponse(
        userId: json['userId'] as String,
        email: json['email'] as String,
        title: json['title'] as String,
        desc: json['desc'] as String,
        status: json['status'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        id: json['id'] as String,
        taskGroup: json['taskGroup'] as String,
      );

  JSON toJson() => <String, dynamic>{
        'userId': userId,
        'email': email,
        'title': title,
        'desc': desc,
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'id': id,
        'taskGroup': taskGroup,
      };

  JSON toJsonTaskProcess() => <String, dynamic>{
        'userId': userId,
        'email': email,
        'title': title,
        'desc': desc,
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'taskGroup': taskGroup,
      };
}
