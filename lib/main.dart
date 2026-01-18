import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/design/shared/theme.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/feature/availablity/bloc/availablity_bloc.dart';
import 'package:quick_token_new/feature/dashboard/bloc/dashboard_bloc.dart';
import 'package:quick_token_new/feature/register/bloc/register_bloc.dart';
import 'package:quick_token_new/repository/auth_repo.dart';
import 'package:quick_token_new/repository/doctor_availablity_repo.dart';
import 'package:quick_token_new/repository/doctores_repo.dart';
import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/services/auth_services.dart';
import 'package:quick_token_new/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authRepo = AuthRepo();
  final doctorsRepo = DoctorsRepo();
  final localStorage = LocalStorageServices();
  final doctorAvailabilityRepo = DoctorAvailabilityRepo(localStorage: localStorage);
  final authServices = AuthServices(authRepo: authRepo, localStorage: localStorage);

  await authServices.initialize();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepo>.value(value: authRepo),
        RepositoryProvider<DoctorsRepo>.value(value: doctorsRepo),
        RepositoryProvider<DoctorAvailabilityRepo>.value(value: doctorAvailabilityRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(authRepo: authRepo, authServices: authServices),
          ),
          BlocProvider<RegisterBloc>(
            create: (_) => RegisterBloc(authRepository: authRepo, authRepo: authRepo),
          ),
          BlocProvider<DashboardBloc>(create: (context) => DashboardBloc(doctorsRepo: context.read<DoctorsRepo>())),
          BlocProvider<AvailablityBloc>(
            create: (context) => AvailablityBloc(availabilityRepo: context.read<DoctorAvailabilityRepo>()),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Qtheme(context: context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Token',
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.light, // or ThemeMode.system
      initialRoute: RoutesHelper.splash,
      onGenerateRoute: RoutesHelper.generateRoute,
    );
  }
}
