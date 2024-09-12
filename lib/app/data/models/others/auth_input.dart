import 'package:pindap_todolist/utils/type.dart';

class AuthInput {
  final String? email, password;

  AuthInput({this.email, this.password});

  factory AuthInput.fromJson(final JSON json) => AuthInput(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  JSON toJson() => <String, dynamic>{
        'email': email,
        'password': password,
      };
}
