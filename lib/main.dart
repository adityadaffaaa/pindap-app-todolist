import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:pindap_todolist/app/data/models/response/user_data_response.dart';
import 'package:pindap_todolist/firebase_option.dart';
import 'package:pindap_todolist/utils/app_extensions.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future<dynamic>.delayed(
    const Duration(
      seconds: 1,
    ),
  );

  FlutterNativeSplash.remove();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final bool result = await AppExtensions.firstTimeCheck();
  final UserDataResponse? user = await AppExtensions.getUserFromLocalStorage();

  runApp(
    MyApp(
      isFirstTime: result,
      isLoggedIn: user != null,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.isFirstTime,
    this.isLoggedIn,
  });
  final bool? isFirstTime;
  final bool? isLoggedIn;
  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "PinDap - Todo List App",
        initialRoute: isFirstTime!
            ? AppPages.INTRODUCTION
            : isLoggedIn!
                ? AppPages.INITIAL
                : AppPages.AUTH,
        getPages: AppPages.routes,
      );
}
