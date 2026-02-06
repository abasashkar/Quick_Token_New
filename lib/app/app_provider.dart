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
    /// Core services
    final localStorage = LocalStorageServices();

    /// Repositories
    final authRepo = AuthRepo();
    final doctorsRepo = DoctorsRepo(localStorage: localStorage);
    final availabilityRepo = DoctorAvailabilityRepo(localStorage: localStorage);
    final bookAppointmentRepo = BookAppointmentRepo(localStorage: localStorage);
    final patientAppointmentRepo = PatientAppointmentRepo(localStorage: localStorage);
    final doctorAppointmentRepo = DoctorAppointmentRepo(localStorage: localStorage);

    /// Services
    final authServices = AuthServices(authRepo: authRepo, localStorage: localStorage);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepo),
        RepositoryProvider.value(value: doctorsRepo),
        RepositoryProvider.value(value: availabilityRepo),
        RepositoryProvider.value(value: bookAppointmentRepo),
        RepositoryProvider.value(value: patientAppointmentRepo),
        RepositoryProvider.value(value: doctorAppointmentRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          /// Auth
          BlocProvider(
            create: (_) => AuthBloc(authRepo: authRepo, authServices: authServices),
          ),

          /// Register
          BlocProvider(
            create: (_) => RegisterBloc(authRepository: authRepo, authRepo: authRepo),
          ),

          /// Dashboard
          BlocProvider(create: (context) => DashboardBloc(doctorsRepo: context.read<DoctorsRepo>())),

          /// Doctor Profile
          BlocProvider(create: (context) => DoctorProfileBloc(doctorsRepo: context.read<DoctorsRepo>())),

          /// Availability
          BlocProvider(create: (context) => AvailablityBloc(availabilityRepo: context.read<DoctorAvailabilityRepo>())),

          /// Book Appointment
          BlocProvider(create: (context) => BookAppointmentBloc(repo: context.read<BookAppointmentRepo>())),

          /// Patient Upcoming Appointments
          BlocProvider(
            create: (context) => PatientUpcominggAppointmentBloc(repo: context.read<PatientAppointmentRepo>()),
          ),

          /// Doctor Pending Appointments
          BlocProvider(create: (context) => DoctorPendingAppointmentBloc(repo: context.read<DoctorAppointmentRepo>())),
        ],
        child: child,
      ),
    );
  }
}
