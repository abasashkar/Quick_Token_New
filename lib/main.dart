import 'package:flutter/material.dart';
import 'package:quick_token_new/app/app_provider.dart';
import 'package:quick_token_new/routes/routes_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Quick Token',
        routerConfig: AppRouter.router,
      ),
    );
  }
}
