import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/feature/auth/ui/create_patient_account.dart';
import 'package:quick_token_new/feature/auth/ui/email_login.dart';
import 'package:quick_token_new/feature/auth/ui/role_selection.dart';
import 'package:quick_token_new/feature/auth/ui/verify_otp.dart';
import 'package:quick_token_new/feature/register/bloc/register_bloc.dart';
import 'package:quick_token_new/feature/register/register_screen.dart';
import 'package:quick_token_new/feature/home/ui/doctor_home_screen.dart';
import 'package:quick_token_new/feature/home/ui/patient_home_screen.dart';
import 'package:quick_token_new/repository/auth_repo.dart';
import 'package:quick_token_new/splash/splash_screen.dart';
import 'package:quick_token_new/core/enums/user_role.dart';

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
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(authRepository: context.read<AuthRepo>(), authRepo: context.read<AuthRepo>()),
            child: const RegisterScreen(),
          ),
        );

      /// ✅ FIXED
      case emailLogin:
        final role = settings.arguments as UserRole? ?? UserRole.patient;
        return MaterialPageRoute(builder: (_) => EmailLoginScreen(intent: role));

      case verifyOtp:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => VerifyOtpScreen(email: args['email'] as String, intent: args['intent'] as UserRole),
        );

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
