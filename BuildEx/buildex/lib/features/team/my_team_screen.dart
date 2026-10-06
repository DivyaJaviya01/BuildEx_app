import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/bottom_nav_bar.dart';
import '../projects/my_projects_screen.dart';
import '../tasks/my_tasks_screen.dart';
import '../profile/my_profile_screen.dart';
import 'invite_member_screen.dart';

// Owner: Krisha. Figma: My Team.
class MyTeamScreen extends StatelessWidget {
  static const route = '/team';
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFBF9),
      appBar: BuildExAppBar(
        title: 'My Team',
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, MyProjectsScreen.route);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, MyTasksScreen.route);
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, MyProfileScreen.route);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () => Navigator.pushNamed(context, InviteMemberScreen.route),
        child: const Icon(Icons.person_add_alt_1_rounded, size: 24, color: Color(0xFF1F2D2E)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // EFFICIENCY INSIGHTS Card
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF14B8A6),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF14B8A6).withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'EFFICIENCY INSIGHTS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF043427),
                        letterSpacing: 0.5,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Team Productivity is up by 12%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF043427),
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: const [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: Color(0xFF043427),
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '142 Tasks Done',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF043427),
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.shield_outlined,
                          color: Color(0xFF043427),
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '0 Accidents',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF043427),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // On Site Today Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'On Site Today',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1E293B),
                      fontFamily: 'Inter',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDE68A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '8 ACTIVE',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF78350F),
                        letterSpacing: 0.5,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Member Card 1: Rajesh Kumar
              _buildMemberCard(
                name: 'Rajesh Kumar',
                role: 'Mason Lead',
                location: 'Skyline Tower A',
                isOffsite: false,
                avatarBg: const Color(0xFF3B82F6),
                avatarIcon: Icons.person,
              ),
              const SizedBox(height: 12),

              // Member Card 2: Ananya Sharma
              _buildMemberCard(
                name: 'Ananya Sharma',
                role: 'Safety Officer',
                location: 'Metropolis Hub',
                isOffsite: false,
                avatarBg: const Color(0xFF10B981),
                avatarIcon: Icons.face_rounded,
              ),
              const SizedBox(height: 12),

              // Member Card 3: David Chen (OFF-SITE)
              _buildMemberCard(
                name: 'David Chen',
                role: 'Electrician Specialist',
                lastSeen: 'Last seen: 4h ago',
                isOffsite: true,
                avatarBg: const Color(0xFF8B5CF6),
                avatarIcon: Icons.engineering_rounded,
              ),
              const SizedBox(height: 12),

              // Member Card 4: Vikram Singh
              _buildMemberCard(
                name: 'Vikram Singh',
                role: 'Structural Engineer',
                location: 'Skyline Tower A',
                isOffsite: false,
                avatarBg: const Color(0xFFF59E0B),
                avatarIcon: Icons.construction_rounded,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemberCard({
    required String name,
    required String role,
    String? location,
    String? lastSeen,
    required bool isOffsite,
    required Color avatarBg,
    required IconData avatarIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isOffsite ? const Color(0xFFF0FDFB) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isOffsite
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 46,
                  height: 46,
                  color: avatarBg.withValues(alpha: 0.15),
                  child: Icon(avatarIcon, size: 26, color: avatarBg),
                ),
              ),
              const SizedBox(width: 14),

              // Name & Role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF64748B),
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),

              // Status Badge
              if (!isOffsite)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ContainerDot(color: Color(0xFF16A34A)),
                      SizedBox(width: 4),
                      Text(
                        'PRESENT',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF16A34A),
                          letterSpacing: 0.5,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'OFF-SITE',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF475569),
                      letterSpacing: 0.5,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFF1F5F9), height: 1),
          const SizedBox(height: 10),

          // Location or Last Seen Row
          Row(
            children: [
              if (!isOffsite) ...[
                const Icon(
                  Icons.explore_outlined,
                  size: 16,
                  color: Color(0xFF64748B),
                ),
                const SizedBox(width: 6),
                Text(
                  location ?? '',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475569),
                    fontFamily: 'Inter',
                  ),
                ),
              ] else ...[
                const Icon(
                  Icons.history_rounded,
                  size: 16,
                  color: Color(0xFF64748B),
                ),
                const SizedBox(width: 6),
                Text(
                  lastSeen ?? '',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerDot extends StatelessWidget {
  final Color color;
  const ContainerDot({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
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

