import 'package:flutter/material.dart';
import 'screens/home/auth_screen.dart'; // Handles the new sliding capsule layout

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Johar GK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF7A00),
        scaffoldBackgroundColor: const Color(0xFF0A0D14),
      ),
      home: const AuthScreen(),
    );
  }
}
