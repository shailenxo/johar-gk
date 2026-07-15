import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/home/home_screen.dart';

class JoharGKApp extends StatelessWidget {
  const JoharGKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Johar GK',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
