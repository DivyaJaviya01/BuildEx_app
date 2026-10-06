import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../projects/my_projects_screen.dart';
import 'create_account_screen.dart';

// Owner: Krisha. Figma: Sign In.
class SignInScreen extends StatefulWidget {
  static const route = '/sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState?.validate() ?? false) {
      // Navigate to My Projects screen on successful sign in
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top Logo Box
                Container(
                  width: 76,
                  height: 76,
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
                      size: Size(38, 38),
                      painter: _CrossedToolsPainter(),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // App Title
                const Text(
                  'BuildEx',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E293B),
                    letterSpacing: 2.5,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle Tagline
                const Text(
                  'Precision management for modern\ninfrastructure projects.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF556365),
                    height: 1.35,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 28),

                // Form Card Container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card Header
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Access your site dashboard',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSecondary,
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Username / Email Field
                        const Text(
                          'Username / Email',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF334155),
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your username or email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your credentials',
                            hintStyle: const TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 14,
                              fontFamily: 'Inter',
                            ),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xFF64748B),
                              size: 20,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
                        const SizedBox(height: 18),

                        // Password Field Label + Forgot Password Link Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF334155),
                                fontFamily: 'Inter',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Password reset link sent to registered email'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: '••••••••',
                            hintStyle: const TextStyle(
                              color: Color(0xFF475569),
                              fontSize: 14,
                              letterSpacing: 2.0,
                              fontFamily: 'Inter',
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Color(0xFF64748B),
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: const Color(0xFF64748B),
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
                        const SizedBox(height: 24),

                        // SIGN IN Button
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
                            onPressed: _handleSignIn,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'SIGN IN',
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

                        // Divider
                        const Divider(
                          color: Color(0xFFF1F5F9),
                          thickness: 1,
                        ),
                        const SizedBox(height: 16),

                        // Card Footer Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Are you a Builder? ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF64748B),
                                fontFamily: 'Inter',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, CreateAccountScreen.route);
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1E293B),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Bottom Page Footer Text
                const Text(
                  'CERTIFIED SITE RELIABILITY V4.2',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF64787A),
                    letterSpacing: 2.0,
                    fontFamily: 'Inter',
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

