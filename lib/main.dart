import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_token_new/appointment/upcomming_appointent.dart';
import 'package:quick_token_new/controllers/appointment_controller.dart';
import 'package:quick_token_new/home/doctors_dashboard.dart';
import 'package:quick_token_new/controllers/appointment_controller.dart';
import 'package:quick_token_new/controllers/auth_controller.dart';
import 'package:quick_token_new/controllers/doctor_controller.dart';
import 'package:quick_token_new/controllers/patient_controller.dart';
import 'package:quick_token_new/controllers/theme_controller.dart';
import 'package:quick_token_new/home/doctor_home_screen.dart';
import 'package:quick_token_new/home/patient_home_screen.dart';

import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/splash/splash_screen.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<AuthController>(() => AuthController());
  Get.lazyPut<DoctorController>(() => DoctorController());
  Get.lazyPut<AppointmentController>(() => AppointmentController());
  Get.lazyPut<PatientController>(() => PatientController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quick Token',
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color(0xFFF5F7FA),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF4F8BFF),
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          ),
          cardColor: Colors.white,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black87),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF121212),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          ),
          cardColor: const Color(0xFF1E1E1E),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white70),
          ),
        ),
        themeMode: themeController.theme,
        getPages: RoutesHelper.routes,
        home: SplashScreen(),
      ),
    );
  }
}
