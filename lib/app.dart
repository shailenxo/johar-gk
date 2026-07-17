import 'screens/home/login_screen.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

class JoharGKApp extends StatelessWidget {
  const JoharGKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Johar GK',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
