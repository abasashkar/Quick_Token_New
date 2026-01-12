import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/binding/app_binding.dart';
import 'package:quick_token_new/core/design/shared/theme.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/repository/auth_repo.dart';
import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/services/auth_services.dart';
import 'package:quick_token_new/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1️⃣ Create instances
  final authRepo = AuthRepo();
  final localStorage = LocalStorageServices();
  final authServices = AuthServices(authRepo: authRepo, localStorage: localStorage);

  // 2️⃣ Initialize AuthServices to load token from storage
  await authServices.initialize();

  // 3️⃣ Run app with BlocProvider
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepo: authRepo, authServices: authServices),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Qtheme(context: context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Token',
      initialBinding: AppBinding(),
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.light, // or ThemeMode.system
      initialRoute: RoutesHelper.splash,
      onGenerateRoute: RoutesHelper.generateRoute,
    );
  }
}
