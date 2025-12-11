import 'package:get/get.dart';
import 'package:quick_token_new/appointment/patient_appointment.dart';
import 'package:quick_token_new/authentication/create_patient_account.dart';
import 'package:quick_token_new/authentication/doctor_Login.dart';
import 'package:quick_token_new/authentication/laboratory_Login.dart';
import 'package:quick_token_new/authentication/patient_Login.dart';
import 'package:quick_token_new/authentication/sign_in.dart';
import 'package:quick_token_new/authentication/verify_otp.dart';
import 'package:quick_token_new/doctors/doctors_bio.dart';
import 'package:quick_token_new/home/doctor_home_screen.dart';
import 'package:quick_token_new/home/patient_dashboard.dart';
import 'package:quick_token_new/home/patient_home_screen.dart';
import 'package:quick_token_new/splash/splash_screen.dart';

class RoutesHelper {
  // Route names
  static const String initial = "/";
  static const String splash = "/splash";
  static const String patientAppointment = "/patientAppointment";
  static const String topDoctors = "/topDoctors";
  static const String doctorsBio = "/doctorsBio";
  static const String homescreen = "/homescreen";
  static const String doctorsHomeScreen = "/doctorshomeScreen";
  static const String patientsHomeScreen = "/doctorshomeScreen";
  static const String createPatientScreen = "/createPatientScreen";
  //  Auth Routes
  static const String patientLogin = "/patientLogin";
  static const String doctorLogin = "/doctorLogin";
  static const String labLogin = "/labLogin";
  static const String verifyOtp = "/verifyOtp";

  // Route getters
  static String getInitial() => '$initial';
  static String getSplash() => '$splash';
  static String getPatientAppointment() => '$patientAppointment';
  static String getPatientLogin() => '$patientLogin';
  static String getVerifyOtp() => '$verifyOtp';
  static String getTopDoctors() => '$topDoctors';
  static String getdoctorsBio() => '$doctorsBio';
  static String homeScreen() => '$homescreen';
  static String getLabLogin() => '$labLogin';
  static String getDoctorLogin() => '$doctorLogin';
  static String getDoctorsHomeScreen() => '$doctorsHomeScreen';
  static String getPatientHomeScreen() => '$patientsHomeScreen';
  static String getCreatePatientScreen() => '$createPatientScreen';

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
      name: doctorLogin,
      page: () => const DoctorLogin(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: labLogin,
      page: () => const LaboratoryLogin(),
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
    GetPage(
      name: doctorsHomeScreen,
      page: () => const DoctorHomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: patientsHomeScreen,
      page: () => const PatientHomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: createPatientScreen,
      page: () => const CreatePatientAccount(),
      transition: Transition.fadeIn,
    ),
  ];
}
