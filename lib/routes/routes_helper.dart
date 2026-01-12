import 'package:flutter/material.dart';
import 'package:quick_token_new/feature/auth/ui/create_patient_account.dart';
import 'package:quick_token_new/feature/auth/ui/register_screen.dart';
import 'package:quick_token_new/feature/auth/ui/role_selection.dart';
import 'package:quick_token_new/home/doctor_home_screen.dart';
import 'package:quick_token_new/home/patient_home_screen.dart';
import 'package:quick_token_new/splash/splash_screen.dart';


class RoutesHelper {
  static const String splash = "/";
  static const String register = "/register";
  static const String emailLogin = "/emailLogin";
  static const String verifyOtp = "/verifyOtp";
  static const String patientHomeScreen = "/patientsHomeScreen";
  static const String roleselection = "/roleSelection";
  static const String doctorHomeScreen = "/doctorLogin";
  static const String createPatientScreen = "/createPatientScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      // case emailLogin:
      //   final args = settings.arguments as LoginIntent? ?? LoginIntent.patient;
      //   return MaterialPageRoute(builder: (_) => EmailLoginScreen(intent: args));

      // case verifyOtp:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => VerifyOtpScreen(email: args['email'] as String, intent: args['intent'] as LoginIntent),
      //   );

      case patientHomeScreen:
        return MaterialPageRoute(builder: (_) => const PatientHomeScreen());

      case doctorHomeScreen:
        return MaterialPageRoute(builder: (_) => const DoctorHomeScreen());

      case roleselection:
        return MaterialPageRoute(builder: (_) => const RoleSelection());

      case createPatientScreen:
        return MaterialPageRoute(builder: (_) => const CreatePatientAccount());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))),
        );
    }
  }
}
