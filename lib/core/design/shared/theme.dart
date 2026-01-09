import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';


class Qtheme {
  final BuildContext context;

  Qtheme({required this.context});

  ThemeData get lightTheme {
    // Set system status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF5F7FA),
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      primaryColor: Qcolors.primary,
      useMaterial3: false,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Qcolors.onPrimaryText,
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Qcolors.primary,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        centerTitle: true,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: Qcolors.primary),
      checkboxTheme: const CheckboxThemeData(
        checkColor: MaterialStatePropertyAll(Qcolors.secondary),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return Qcolors.primary;
            }
            return Qcolors.divider;
          },
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121212),
      primaryColor: Qcolors.primary,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Qcolors.onPrimaryText,
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        centerTitle: true,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: Qcolors.primary),
    );
  }
}
