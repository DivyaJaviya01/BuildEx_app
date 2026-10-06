import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../projects/my_projects_screen.dart';
import 'sign_in_screen.dart';

// Owner: Krisha. Figma: Create Account.
class CreateAccountScreen extends StatefulWidget {
  static const route = '/create-account';
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _selectedRole;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final List<String> _roles = [
    'Project Manager',
    'Site Engineer',
    'Contractor',
    'Supervisor',
    'Architect',
    'Client / Owner',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedRole == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your role')),
        );
        return;
      }

      // Navigate to My Projects screen on successful account creation
      Navigator.pushReplacementNamed(context, MyProjectsScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFBF9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top Logo Box
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: CustomPaint(
                      size: Size(36, 36),
                      painter: _CrossedToolsPainter(),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Title
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E293B),
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 6),

                // Subtitle
                const Text(
                  'Join the professional construction network',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF556365),
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 24),

                // Form Container
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name Field
                      const Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334155),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _fullNameController,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your full name',
                          hintStyle: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                          suffixIcon: const Icon(
                            Icons.person_outline_rounded,
                            color: Color(0xFF94A3B8),
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Email Address Field
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334155),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'name@company.com',
                          hintStyle: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF94A3B8),
                            size: 20,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Choose Role Dropdown Field
                      const Text(
                        'Choose Role',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334155),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        initialValue: _selectedRole,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your role';
                          }
                          return null;
                        },
                        hint: const Text(
                          'Select your role',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF94A3B8),
                          size: 22,
                        ),

                        items: _roles.map((role) {
                          return DropdownMenuItem<String>(
                            value: role,
                            child: Text(
                              role,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textPrimary,
                                fontFamily: 'Inter',
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334155),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please create a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Create a strong password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.lock_outline_rounded,
                              color: const Color(0xFF94A3B8),
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Confirm Password Field
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334155),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Repeat your password',
                          hintStyle: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.shield_outlined,
                              color: const Color(0xFF94A3B8),
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.primary, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Disclaimer Text
                      const Text(
                        'By signing up, you agree to our Terms of Service and Privacy Policy for professional site management.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF64748B),
                          height: 1.35,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 20),

                      // SIGN UP Button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: const Color(0xFF1F2D2E),
                            elevation: 2,
                            shadowColor: AppColors.accent.withValues(alpha: 0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _handleSignUp,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.2,
                                  color: Color(0xFF1F2D2E),
                                  fontFamily: 'Inter',
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 18,
                                color: Color(0xFF1F2D2E),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Bottom Sign In Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF64748B),
                              fontFamily: 'Inter',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pushReplacementNamed(context, SignInScreen.route);
                              }
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

class _CrossedToolsPainter extends CustomPainter {
  const _CrossedToolsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final scale = size.width / 48.0;

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // --- WRENCH (Crosses top-left to bottom-right, -45 deg) ---
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(scale);
    canvas.rotate(-0.785398);

    // Wrench handle
    final wrenchHandle = RRect.fromLTRBR(-2.5, -9, 2.5, 18, const Radius.circular(2.5));
    canvas.drawRRect(wrenchHandle, paint);

    // Wrench Head (jaw prongs)
    final wrenchHead = Path()
      ..moveTo(-5.5, -9)
      ..lineTo(-7.5, -15)
      ..arcToPoint(
        const Offset(7.5, -15),
        radius: const Radius.circular(7.5),
        clockwise: true,
      )
      ..lineTo(5.5, -9)
      ..lineTo(3.0, -9)
      ..lineTo(3.0, -15)
      ..lineTo(-3.0, -15)
      ..lineTo(-3.0, -9)
      ..close();
    canvas.drawPath(wrenchHead, paint);
    canvas.restore();

    // --- HAMMER (Crosses top-right to bottom-left, +45 deg) ---
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(scale);
    canvas.rotate(0.785398);

    // Hammer handle
    final hammerHandle = RRect.fromLTRBR(-2.5, -9, 2.5, 18, const Radius.circular(2.5));
    canvas.drawRRect(hammerHandle, paint);

    // Hammer Head (claw on left, flat striking face on right)
    final hammerHead = Path();
    hammerHead.moveTo(-3, -10);
    hammerHead.cubicTo(-7, -10, -11, -7, -10, -4);
    hammerHead.cubicTo(-9, -7, -6, -9, -3, -9);
    hammerHead.lineTo(6, -9);
    hammerHead.lineTo(7, -7);
    hammerHead.lineTo(9.5, -7);
    hammerHead.lineTo(9.5, -14);
    hammerHead.lineTo(7, -14);
    hammerHead.lineTo(6, -12);
    hammerHead.lineTo(-3, -12);
    hammerHead.close();
    canvas.drawPath(hammerHead, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

