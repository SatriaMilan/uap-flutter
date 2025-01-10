import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/akstivitas/views/akstivitas_view.dart';
import 'package:myapp/app/modules/auth/views/auth_view.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import 'package:myapp/app/modules/profile/views/profile_view.dart';
import 'package:myapp/app/modules/promo/views/promo_view.dart';
import 'package:myapp/app/routes/app_pages.dart';
import 'package:myapp/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/modules/auth/controllers/auth_controller.dart';
// import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  final AuthController _authController = Get.put(AuthController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: _authController.isLoggedIn.value ? Routes.HOME : Routes.AUTH,
      getPages: AppPages.routes,
    ),
  );
}
