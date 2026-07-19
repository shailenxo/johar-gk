import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _agreeToTerms = false;
  String _selectedMethod =
      'email'; // 'email' or 'phone' to keep UI incredibly clean

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF0A0D14), // Matches your premium login matte canvas
      body: Stack(
        children: [
          // 🌌 BACKGROUND: Subtle matching ambient accent glows
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.6, -0.2),
                  radius: 1.2,
                  colors: [
                    Color(0x12143F2E), // Subdued green mist
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.5, 0.5),
                  radius: 1.4,
                  colors: [
                    Color(0x0CFF7A00), // Minimalist brand orange touch
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ),

          // 🪐 SCROLLABLE CONTENT LAYER
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
                    // 🏷️ BRAND LOGO
                    Container(
                      constraints:
                          const BoxConstraints(maxHeight: 110, maxWidth: 110),
                      child: Image.asset(
                        'assets/brand/jgk_final.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.auto_awesome_mosaic_rounded,
                          color: Color(0xFFFF7A00),
                          size: 54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // TYPOGRAPHY HEADERS
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Join Johar GK to start your preparation',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        letterSpacing: -0.1,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 🎛️ METHOD SWITCHER (Keeps UI uncluttered)
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF121722),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF1D2433)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildSwitchTab(
                              label: 'Email / Username',
                              isActive: _selectedMethod == 'email',
                              onTap: () =>
                                  setState(() => _selectedMethod = 'email'),
                            ),
                          ),
                          Expanded(
                            child: _buildSwitchTab(
                              label: 'Phone Number',
                              isActive: _selectedMethod == 'phone',
                              onTap: () =>
                                  setState(() => _selectedMethod = 'phone'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 📝 DYNAMIC FORM FIELDS
                    _buildInputLabel('Username'),
                    const SizedBox(height: 8),
                    _buildMinimalTextField(
                      controller: _usernameController,
                      hint: 'johargk_warrior',
                    ),
                    const SizedBox(height: 16),

                    if (_selectedMethod == 'email') ...[
                      _buildInputLabel('Email Address'),
                      const SizedBox(height: 8),
                      _buildMinimalTextField(
                        controller: _emailController,
                        hint: 'you@domain.com',
                        hasOrangeBorder: true,
                      ),
                      const SizedBox(height: 16),
                      _buildInputLabel('Password'),
                      const SizedBox(height: 8),
                      _buildMinimalTextField(
                        controller: _passwordController,
                        hint: '••••••••••••',
                        obscure: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                          onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                    ] else ...[
                      _buildInputLabel('Mobile Number'),
                      const SizedBox(height: 8),
                      _buildMinimalTextField(
                        controller: _phoneController,
                        hint: '+91 XXXXX XXXXX',
                        keyboardType: TextInputType.phone,
                        hasOrangeBorder: true,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'An OTP code will be sent to verify your number',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 11),
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),

                    // 📑 LEGAL TERMS CHECKBOX
                    GestureDetector(
                      onTap: () =>
                          setState(() => _agreeToTerms = !_agreeToTerms),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              color: _agreeToTerms
                                  ? const Color(0xFF16222F)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: _agreeToTerms
                                    ? const Color(0xFFFF7A00)
                                    : const Color(0xFF222B35),
                                width: 1.5,
                              ),
                            ),
                            child: _agreeToTerms
                                ? const Icon(Icons.check,
                                    color: Color(0xFFFF7A00), size: 12)
                                : null,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 12,
                                    height: 1.4),
                                children: const [
                                  TextSpan(text: 'I agree to the '),
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(
                                        color: Color(0xFFFF7A00),
                                        decoration: TextDecoration.underline),
                                  ),
                                  TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                        color: Color(0xFFFF7A00),
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // BUTTON: SUBMIT REGISTRATION / REQUEST OTP
                    GestureDetector(
                      onTap: () {
                        // Registration backend triggers will wire here later
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
                        child: Center(
                          child: Text(
                            _selectedMethod == 'email'
                                ? 'Sign up'
                                : 'Send OTP Verification',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // OAUTH SOCIAL INTEGRATION SEPARATORS
                    Text('or register instantly using',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 13)),
                    const SizedBox(height: 20),

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
                    const SizedBox(height: 32),

                    // LINK BACK TO LOGIN
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 13)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Sign in',
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTab(
      {required String label,
      required bool isActive,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF1D2433) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[500],
            fontSize: 13,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
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
    TextInputType keyboardType = TextInputType.text,
    bool hasOrangeBorder = false,
    Widget? suffixIcon,
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
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
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
