import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isOtpSent = false;
  bool _isLoading = false;

  final supabase = Supabase.instance.client;

  // Google Sign-In Handler
  Future<void> _signInWithGoogle() async {
    try {
      setState(() => _isLoading = true);
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: kIsWeb ? null : 'io.supabase.flutter://login-callback',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google Sign-In Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Send Phone OTP Handler
  Future<void> _sendOtp() async {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) return;

    try {
      setState(() => _isLoading = true);
      final formattedPhone = phone.startsWith('+') ? phone : '+91$phone';

      await supabase.auth.signInWithOtp(
        phone: formattedPhone,
      );

      setState(() => _isOtpSent = true);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP sent successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error sending OTP: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Verify Phone OTP Handler
  Future<void> _verifyOtp() async {
    final phone = _phoneController.text.trim();
    final token = _otpController.text.trim();
    if (token.isEmpty) return;

    try {
      setState(() => _isLoading = true);
      final formattedPhone = phone.startsWith('+') ? phone : '+91$phone';

      await supabase.auth.verifyOTP(
        phone: formattedPhone,
        token: token,
        type: OtpType.sms,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully logged in!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Johar GK - Sign In'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: _isLoading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Welcome to Johar GK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Phone / OTP Section
                      if (!_isOtpSent) ...[
                        TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            hintText: '9334861103',
                            prefixText: '+91 ',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _sendOtp,
                          child: const Text('Send OTP'),
                        ),
                      ] else ...[
                        TextField(
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Enter 6-digit OTP',
                            hintText: '123456',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _verifyOtp,
                          child: const Text('Verify OTP'),
                        ),
                        TextButton(
                          onPressed: () => setState(() => _isOtpSent = false),
                          child: const Text('Change Phone Number'),
                        ),
                      ],

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0),
                        child: Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('OR'),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                      ),

                      // Google Sign-In Button
                      OutlinedButton.icon(
                        onPressed: _signInWithGoogle,
                        icon: const Icon(Icons.g_mobiledata, size: 32),
                        label: const Text('Continue with Google'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
