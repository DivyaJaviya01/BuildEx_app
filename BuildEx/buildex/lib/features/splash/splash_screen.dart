import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../auth/sign_in_screen.dart';

// Owner: Krisha. Figma: Splash Screen (first frame, right tree top).
class SplashScreen extends StatefulWidget {
  static const route = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 0.45).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();

    // Auto-navigate to Sign In Screen after loading
    Future.delayed(const Duration(milliseconds: 2200), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, SignInScreen.route);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFBF9),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Center Logo Container & Text
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Teal rounded box with shadow & crossed tools icon
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.25),
                          blurRadius: 24,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: CustomPaint(
                        size: Size(48, 48),
                        painter: _CrossedToolsPainter(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // App Title
                  const Text(
                    'BUILDEX',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                      letterSpacing: 4.5,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  const Text(
                    'Site Management Core',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.2,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(flex: 3),

            // Bottom Loading Bar & Label
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Progress Bar Track
                  SizedBox(
                    width: 240,
                    height: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2.0),
                      child: AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          return LinearProgressIndicator(
                            value: _progressAnimation.value,
                            backgroundColor: const Color(0xFFDDEEEF),
                            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Loading Label
                  const Text(
                    'LOADING RESOURCES',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64787A),
                      letterSpacing: 2.5,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
          ],
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

