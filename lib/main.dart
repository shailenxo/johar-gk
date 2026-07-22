import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Update these two lines:
import 'screens/home/auth_screen.dart';
import 'screens/home/home_screen.dart'; // Make sure this matches your home screen file name

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL', // Paste your Supabase URL here
    anonKey: 'YOUR_SUPABASE_ANON_KEY', // Paste your Supabase Anon Key here
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Johar GK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          final session = snapshot.data?.session;

          // If session exists, user is authenticated -> Show Home Screen
          if (session != null) {
            return const HomeScreen();
          }

          // Otherwise -> Show Auth Screen
          return const AuthScreen();
        },
      ),
    );
  }
}
