import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/feature/appointment/bloc/book_appointment_bloc.dart';
import 'package:quick_token_new/feature/appointment/upcoming/bloc/doctor_pending_appointment_bloc.dart';
import 'package:quick_token_new/feature/appointment/upcoming/bloc/patient_upcomingg_appointment_bloc.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/feature/availablity/bloc/availablity_bloc.dart';
import 'package:quick_token_new/feature/dashboard/bloc/dashboard_bloc.dart';
import 'package:quick_token_new/feature/doctor/bloc/doctor_profile_bloc.dart';
import 'package:quick_token_new/feature/register/bloc/register_bloc.dart';
import 'package:quick_token_new/repository/auth_repo.dart';
import 'package:quick_token_new/repository/book_appointment_repo.dart';
import 'package:quick_token_new/repository/doctor_appointment_repo.dart';
import 'package:quick_token_new/repository/doctor_availablity_repo.dart';
import 'package:quick_token_new/repository/doctores_repo.dart';
import 'package:quick_token_new/repository/patient_appointment_repo.dart';
import 'package:quick_token_new/services/auth_services.dart';
import 'package:quick_token_new/services/local_storage_service.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    //This pace is registring repo or any kinda strorage ashkar

    final localStorage = LocalStorageServices();
    final authRepo = AuthRepo();
    final doctorsRepo = DoctorsRepo(localStorage: localStorage);
    final availabilityRepo = DoctorAvailabilityRepo(localStorage: localStorage);
    final bookAppointmentRepo = BookAppointmentRepo(localStorage: localStorage);
    final doctorAppointmentRepo = DoctorAppointmentRepo(localStorage: localStorage);
    final authServices = AuthServices(authRepo: authRepo, localStorage: localStorage);
    final patientAppointmentRepo = PatientAppointmentRepo(localStorage: localStorage);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepo),
        RepositoryProvider.value(value: doctorsRepo),
        RepositoryProvider.value(value: availabilityRepo),
        RepositoryProvider.value(value: bookAppointmentRepo),
        RepositoryProvider.value(value: patientAppointmentRepo),

        /// ✅ FIX 1: PROVIDE THIS
        RepositoryProvider.value(value: doctorAppointmentRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PatientUpcominggAppointmentBloc(repo: context.read<PatientAppointmentRepo>()),
          ),
          BlocProvider(
            create: (_) => AuthBloc(authRepo: authRepo, authServices: authServices),
          ),
          BlocProvider(
            create: (_) => RegisterBloc(authRepository: authRepo, authRepo: authRepo),
          ),
          BlocProvider(create: (context) => DashboardBloc(doctorsRepo: context.read<DoctorsRepo>())),
          BlocProvider(create: (context) => DoctorProfileBloc(doctorsRepo: context.read<DoctorsRepo>())),
          BlocProvider(create: (context) => AvailablityBloc(availabilityRepo: context.read<DoctorAvailabilityRepo>())),

          BlocProvider(create: (context) => BookAppointmentBloc(repo: context.read<BookAppointmentRepo>())),

          /// ✅ FIX 2: NO child here
          BlocProvider(create: (context) => DoctorPendingAppointmentBloc(repo: context.read<DoctorAppointmentRepo>())),
        ],
        child: child,
      ),
    );
  }
}
