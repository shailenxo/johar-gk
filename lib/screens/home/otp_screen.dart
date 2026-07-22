import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Get current session/user
  User? get currentUser => _supabase.auth.currentUser;

  // Send OTP to phone number
  Future<void> sendOtp(String phone) async {
    final formattedPhone = phone.startsWith('+') ? phone : '+91$phone';
    await _supabase.auth.signInWithOtp(
      phone: formattedPhone,
    );
  }

  // Verify OTP
  Future<AuthResponse> verifyOtp(String phone, String token) async {
    final formattedPhone = phone.startsWith('+') ? phone : '+91$phone';
    return await _supabase.auth.verifyOTP(
      phone: formattedPhone,
      token: token,
      type: OtpType.sms,
    );
  }

  // Sign In with Google OAuth
  Future<bool> signInWithGoogle() async {
    return await _supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'io.supabase.flutter://login-callback',
    );
  }

  // Sign Out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
