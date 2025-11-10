import 'package:get/get.dart';
import 'package:quick_token_new/appointment/patient_appointment.dart';
import 'package:quick_token_new/authentication/patient_Login.dart';
import 'package:quick_token_new/authentication/sign_in.dart';
import 'package:quick_token_new/authentication/verify_otp.dart';
import 'package:quick_token_new/doctors/doctors_bio.dart';
import 'package:quick_token_new/home/patient_dashboard.dart';
import 'package:quick_token_new/home/patient_home_screen.dart';
import 'package:quick_token_new/splash/splash_screen.dart';

class RoutesHelper {
  // Route names
  static const String initial = "/";
  static const String splash = "/splash";
  static const String patientAppointment = "/patientAppointment";
  static const String patientLogin = "/patientLogin";
  static const String verifyOtp = "/verifyOtp";
  static const String topDoctors = "/topDoctors";
  static const String doctorsBio = "/doctorsBio";
  static const String homescreen = "/homescreen";

  // Route getters
  static String getInitial() => '$initial';
  static String getSplash() => '$splash';
  static String getPatientAppointment() => '$patientAppointment';
  static String getPatientLogin() => '$patientLogin';
  static String getVerifyOtp() => '$verifyOtp';
  static String getTopDoctors() => '$topDoctors';
  static String getdoctorsBio() => '$doctorsBio';
  static String homeScreen() => '$homescreen';

  // Route list
  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: patientLogin,
      page: () => const PatientLogin(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: patientAppointment,
      page: () => const PatientAppointment(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: verifyOtp,
      page: () => const VerifyOtpScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: homescreen,
      page: () => const PatientHomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: topDoctors,
      page: () => const FindDoctors(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: doctorsBio,
      page: () => const DoctorsBio(),
      transition: Transition.fadeIn,
    ),
  ];
}
