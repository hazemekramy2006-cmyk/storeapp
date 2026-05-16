import 'package:flutter/material.dart';
import 'package:store_app/Screens/home_screen.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const LuviaApp());
}

class LuviaApp extends StatelessWidget {
  const LuviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LUVIA',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.secondary,
          secondary: AppColors.accent,
          surface: AppColors.background,
          onSurface: AppColors.titleText,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.apply(bodyColor: AppColors.titleText, displayColor: AppColors.titleText),
        iconTheme: const IconThemeData(color: AppColors.iconColor),
        splashFactory: NoSplash.splashFactory,
      ),
      home: const HomeScreen(),
    );
  }
}
