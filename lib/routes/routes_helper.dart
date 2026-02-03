import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/feature/auth/ui/email_login.dart';
import 'package:quick_token_new/feature/auth/ui/role_selection.dart';
import 'package:quick_token_new/feature/auth/ui/verify_otp.dart';
import 'package:quick_token_new/feature/doctor/ui/complete_profile_page.dart';
import 'package:quick_token_new/feature/home/ui/doctor_home_screen.dart';
import 'package:quick_token_new/feature/home/ui/patient_home_screen.dart';
import 'package:quick_token_new/feature/register/bloc/register_bloc.dart';
import 'package:quick_token_new/feature/register/register_screen.dart';
import 'package:quick_token_new/repository/auth_repo.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      /// Splash
      GoRoute(
        path: '/',
        builder: (context, state) => const EmailLoginScreen(intent: UserRole.patient),
      ),

      /// Register (Bloc)
      GoRoute(
        path: '/register',
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                RegisterBloc(authRepository: context.read<AuthRepo>(), authRepo: context.read<AuthRepo>()),
            child: const RegisterScreen(),
          );
        },
      ),

      /// Email Login
      GoRoute(
        path: '/emailLogin',
        builder: (context, state) {
          final role = state.extra as UserRole? ?? UserRole.patient;
          return EmailLoginScreen(intent: role);
        },
      ),

      /// Verify OTP
      GoRoute(
        path: '/verifyOtp',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return VerifyOtpScreen(email: args['email'] as String, intent: args['intent'] as UserRole);
        },
      ),

      /// Role Selection
      GoRoute(path: '/roleSelection', builder: (context, state) => const RoleSelection()),

      /// Patient Home
      GoRoute(path: '/patientsHomeScreen', builder: (context, state) => const PatientHomeScreen()),

      /// Doctor Home (guarded)
      GoRoute(
        path: '/doctorHomeScreen',
        builder: (context, state) => const DoctorHomeScreen(),
        redirect: (context, state) {
          final auth = context.read<AuthBloc>().state;

          if (auth.role == UserRole.doctor.name && auth.isProfileCompleted == false) {
            return '/doctorCompleteProfile';
          }
          return null;
        },
      ),

      /// Doctor Complete Profile (guarded)
      GoRoute(path: '/doctorCompleteProfile', builder: (context, state) => const DoctorCompleteProfilePage()),

      // /// Create Patient
      // GoRoute(
      //   path: '/createPatientScreen',
      //   builder: (context, state) => const CreatePatientAccount(),
      // ),

      // /// Doctor Availability
      // GoRoute(
      //   path: '/doctorAvailablity',
      //   builder: (context, state) => const DoctorAvailabilityPage(),
      // ),

      // /// Availability Success
      // GoRoute(
      //   path: '/patientAvailablity',
      //   builder: (context, state) => const DoctorAvailabilitySuccessPage(),
      // ),
    ],

    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('No route defined for ${state.uri.path}'))),
  );
}
