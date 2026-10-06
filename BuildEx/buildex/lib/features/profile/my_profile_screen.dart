import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/bottom_nav_bar.dart';
import '../auth/sign_in_screen.dart';
import '../projects/my_projects_screen.dart';
import '../tasks/my_tasks_screen.dart';
import '../team/my_team_screen.dart';

// Owner: Krisha. Figma: My Profile.
class MyProfileScreen extends StatelessWidget {
  static const route = '/profile';
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFBF9),
      appBar: BuildExAppBar(
        title: 'BuildTrack',
        leading: Center(
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const CustomPaint(
              size: Size(20, 20),
              painter: _CrossedToolsPainter(),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BuildExBottomNav(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, MyProjectsScreen.route);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, MyTasksScreen.route);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, MyTeamScreen.route);
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              // User Avatar with Yellow Edit Badge
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 96,
                      height: 96,
                      color: const Color(0xFFE2E8F0),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 56,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.edit_rounded,
                        size: 14,
                        color: Color(0xFF1F2D2E),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // User Name
              const Text(
                'Alex Thompson',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E293B),
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 4),

              // Role Tag
              const Text(
                'SITE ENGINEER',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  letterSpacing: 0.8,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 4),

              // Email Address
              const Text(
                'a.thompson@buildtrack.com',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 20),

              // EDIT PROFILE Button
              SizedBox(
                width: double.infinity,
                height: 50,
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
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.manage_accounts_outlined,
                        size: 20,
                        color: Color(0xFF1F2D2E),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'EDIT PROFILE',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                          color: Color(0xFF1F2D2E),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Stat Cards Section (2 Columns)
              Row(
                children: [
                  // ACTIVE PROJECTS Stat Card
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
                      child: Column(
                        children: const [
                          Text(
                            '24',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'ACTIVE PROJECTS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF64748B),
                              letterSpacing: 0.5,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // TASKS COMPLETED Stat Card
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
                      child: Column(
                        children: const [
                          Text(
                            '142',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF92400E),
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'TASKS COMPLETED',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF64748B),
                              letterSpacing: 0.5,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Settings Menu List Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    // Item 1: Notification Settings
                    _buildSettingsTile(
                      icon: Icons.notifications_none_rounded,
                      iconBg: const Color(0xFFCCFBF1),
                      iconColor: AppColors.primary,
                      title: 'Notification Settings',
                      subtitle: 'Manage alerts and site updates',
                      onTap: () {},
                    ),
                    const Divider(color: Color(0xFFF1F5F9), height: 1),

                    // Item 2: App Language
                    _buildSettingsTile(
                      icon: Icons.language_rounded,
                      iconBg: const Color(0xFFCCFBF1),
                      iconColor: AppColors.primary,
                      title: 'App Language',
                      subtitle: 'English (United States)',
                      onTap: () {},
                    ),
                    const Divider(color: Color(0xFFF1F5F9), height: 1),

                    // Item 3: Help & Support
                    _buildSettingsTile(
                      icon: Icons.help_outline_rounded,
                      iconBg: const Color(0xFFCCFBF1),
                      iconColor: AppColors.primary,
                      title: 'Help & Support',
                      subtitle: 'FAQs and technical assistance',
                      onTap: () {},
                    ),
                    const Divider(color: Color(0xFFF1F5F9), height: 1),

                    // Item 4: Logout
                    _buildSettingsTile(
                      icon: Icons.logout_rounded,
                      iconBg: const Color(0xFFFEE2E2),
                      iconColor: const Color(0xFFDC2626),
                      title: 'Logout',
                      subtitle: 'Securely sign out of account',
                      isDanger: true,
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          SignInScreen.route,
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    bool isDanger = false,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      onTap: onTap,
      leading: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: iconBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: isDanger ? const Color(0xFFDC2626) : const Color(0xFF1E293B),
          fontFamily: 'Inter',
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: isDanger ? const Color(0xFFF87171) : const Color(0xFF64748B),
          fontFamily: 'Inter',
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: isDanger ? const Color(0xFFF87171) : const Color(0xFF94A3B8),
        size: 22,
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

