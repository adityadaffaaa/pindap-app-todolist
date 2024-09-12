import 'package:pindap_todolist/utils/type.dart';

class UserDataResponse {
  final String uid, email;
  final String? name;

  UserDataResponse({
    required this.uid,
    required this.email,
    this.name,
  });

  factory UserDataResponse.fromJson(final JSON json) => UserDataResponse(
        uid: json['uid'] as String,
        email: json['email'] as String,
        name: json['name'] as String?,
      );

  JSON toJson() => <String, dynamic>{
        'uid': uid,
        'email': email,
        'name': name,
      };
}
