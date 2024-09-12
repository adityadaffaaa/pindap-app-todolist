import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:pindap_todolist/app/api/exceptions.dart';

class AuthService {
  final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;
  final Logger logger = Logger();

  Future<bool> signUp({
    required final String email,
    required final String password,
  }) async {
    final UserCredential result = await firebaseAuthInstance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .onError(
      (final Error e, final StackTrace s) {
        Logger().e('Sign up service failed $e,  stacktrace: $s');
        throw OtherException('Sign up service failed: $e, stacktrace: $s');
      },
    );

    logger.i(result);

    return result.user != null;
  }

  Future<User?> signIn({
    required final String email,
    required final String password,
  }) async {
    final UserCredential result = await firebaseAuthInstance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .onError(
      (final Error e, final StackTrace s) {
        Logger().e('Sign in service failed $e,  stacktrace: $s');
        throw OtherException('Sign in service failed: $e, stacktrace: $s');
      },
    );

    logger.i(result);

    return result.user;
  }
}
