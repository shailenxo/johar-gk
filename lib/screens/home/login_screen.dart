import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'register_screen.dart'; // 🔗 Imported registration page pointer

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0D14), // Premium dark canvas matte
      body: Stack(
        children: [
          // 🌌 BACKGROUND: Subtle ambient aura blend using your brand colors
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center:
                      Alignment(0.6, -0.2), // Soft upper-right branding bleed
                  radius: 1.2,
                  colors: [
                    Color(0x12143F2E), // Subtle Forest Green hue mist
                    Color(0x00000000), // Fades out to slate dark canvas
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center:
                      Alignment(-0.5, 0.5), // Subtle lower-left accent bleed
                  radius: 1.4,
                  colors: [
                    Color(0x0CFF7A00), // Minimalist brand orange aura touch
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ),

          // 🪐 FRONT INTERACTIVE CONTENT LAYER
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🏷️ COMPONENT 1: LOGO DISPLAYER
                    Container(
                      constraints:
                          const BoxConstraints(maxHeight: 150, maxWidth: 150),
                      child: Image.asset(
                        'assets/brand/jgk_final.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.auto_awesome_mosaic_rounded,
                            color: Color(0xFFFF7A00),
                            size: 72,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 28),

                    // COMPONENT 2: TYPOGRAPHY HEADERS
                    const Text(
                      'Sign in to Johar GK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Welcome back — enter your credentials to continue',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        letterSpacing: -0.1,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // 📨 COMPONENT 3: EMAIL / USERNAME FORM FIELD
                    _buildInputLabel('Email or Mobile Number'),
                    const SizedBox(height: 8),
                    _buildMinimalTextField(
                      controller: _emailController,
                      hint: 'you@domain.com or +91...',
                      hasOrangeBorder: true,
                    ),
                    const SizedBox(height: 24),

                    // 🔑 COMPONENT 4: PASSWORD FORM FIELD
                    _buildInputLabel(
                        'Password (Leave blank if requesting OTP)'),
                    const SizedBox(height: 8),
                    _buildMinimalTextField(
                      controller: _passwordController,
                      hint: '••••••••••••',
                      obscure: true,
                    ),
                    const SizedBox(height: 20),

                    // COMPONENT 5: PREFERENCES SELECTORS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              setState(() => _rememberMe = !_rememberMe),
                          child: Row(
                            children: [
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: _rememberMe
                                      ? const Color(0xFF16222F)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: _rememberMe
                                        ? const Color(0xFFFF7A00)
                                        : const Color(0xFF222B35),
                                    width: 1.5,
                                  ),
                                ),
                                child: _rememberMe
                                    ? const Icon(Icons.check,
                                        color: Color(0xFFFF7A00), size: 12)
                                    : null,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, minimumSize: Size.zero),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Color(0xFFFF7A00),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // COMPONENT 6: PREMIUM ACCENT ACTION BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color(0xFF1E2836), width: 1),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF143F2E).withValues(alpha: 0.35),
                              const Color(0xFFFF7A00).withValues(alpha: 0.15),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign in / Request OTP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // COMPONENT 7: SOCIAL OAUTH ACCESSORS
                    Text(
                      'or continue with',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                            child: _buildOAuthButton(
                                'Google', Icons.g_mobiledata_rounded)),
                        const SizedBox(width: 16),
                        Expanded(
                            child:
                                _buildOAuthButton('Facebook', Icons.facebook)),
                      ],
                    ),
                    const SizedBox(height: 36),

                    // FOOTER LINK ROUTERS (Now routes to your new dynamic registration template)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 13)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: const Text(
                            'Create one',
                            style: TextStyle(
                              color: Color(0xFFFF7A00),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    Text(
                      'v1.42.0  •  Privacy  •  Terms',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 11,
                          letterSpacing: 0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String labelText) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: TextStyle(
            color: Colors.grey[400], fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildMinimalTextField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    bool hasOrangeBorder = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF121722),
        borderRadius: BorderRadius.circular(6),
        border: hasOrangeBorder
            ? const Border(
                bottom: BorderSide(color: Color(0xFFFF7A00), width: 2),
                top: BorderSide(color: Color(0xFF1D2433)),
                left: BorderSide(color: Color(0xFF1D2433)),
                right: BorderSide(color: Color(0xFF1D2433)),
              )
            : Border.all(color: const Color(0xFF1D2433), width: 1.5),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildOAuthButton(String label, IconData icon) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF1D2433), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey[400], size: 22),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
