import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';
import '../../resources/widgets/bottom_nav_bar.dart';
import '../projects/my_projects_screen.dart';
import '../tasks/my_tasks_screen.dart';
import '../profile/my_profile_screen.dart';
import 'my_team_screen.dart';

// Owner: Krisha. Figma: Invite Team Member.
class InviteMemberScreen extends StatefulWidget {
  static const route = '/team/invite';
  const InviteMemberScreen({super.key});

  @override
  State<InviteMemberScreen> createState() => _InviteMemberScreenState();
}

class _InviteMemberScreenState extends State<InviteMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _selectedRole;
  String? _selectedProject;

  final List<String> _roles = [
    'Project Manager',
    'Site Engineer',
    'Quality Inspector',
    'Safety Officer',
    'Subcontractor',
    'Architect',
    'Foreman',
  ];

  final List<String> _projects = [
    'Metro Line Phase 2A',
    'Coastal Road Bridge',
    'Skyline Commercial Tower',
    'Green Valley Residential',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _sendInvitation() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invitation sent successfully to ${email.isEmpty ? "team member" : email}!'),
          backgroundColor: const Color(0xFF0D9488),
          duration: const Duration(seconds: 2),
        ),
      );
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFBF9),
      appBar: BuildExAppBar(
        title: 'Invite Member',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BuildExBottomNav(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, MyProjectsScreen.route);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, MyTasksScreen.route);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, MyTeamScreen.route);
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, MyProfileScreen.route);
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Subtitle/Description text
                const Text(
                  'Add a new team member to BuildTrack. They will receive an email invitation to create their account and access assigned projects.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF475569),
                    height: 1.45,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 20),

                // White Form Container Card
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
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name
                      const Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B), fontFamily: 'Inter'),
                        decoration: InputDecoration(
                          hintText: 'e.g. Jainil Trivedi',
                          hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14, fontFamily: 'Inter'),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFF0C6B6D), width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Email Address
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B), fontFamily: 'Inter'),
                        decoration: InputDecoration(
                          hintText: 'jainil.trivedi@example.com',
                          hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14, fontFamily: 'Inter'),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFF0C6B6D), width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Phone Number
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B), fontFamily: 'Inter'),
                        decoration: InputDecoration(
                          hintText: '+91 00000 00000',
                          hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14, fontFamily: 'Inter'),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFF0C6B6D), width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Role Dropdown
                      const Text(
                        'Role',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        initialValue: _selectedRole,
                        hint: const Text(
                          'Select a role',
                          style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontFamily: 'Inter'),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF64748B)),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFF0C6B6D), width: 1.5),
                          ),
                        ),
                        items: _roles
                            .map((role) => DropdownMenuItem(
                                  value: role,
                                  child: Text(
                                    role,
                                    style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B), fontFamily: 'Inter'),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),

                      // Assigned Project Dropdown
                      const Text(
                        'Assigned Project',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        initialValue: _selectedProject,
                        hint: const Text(
                          'Assign to project...',
                          style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontFamily: 'Inter'),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF64748B)),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFF0C6B6D), width: 1.5),
                          ),
                        ),
                        items: _projects
                            .map((proj) => DropdownMenuItem(
                                  value: proj,
                                  child: Text(
                                    proj,
                                    style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B), fontFamily: 'Inter'),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedProject = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // SEND INVITATION Button
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
                    onPressed: _sendInvitation,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.near_me_rounded,
                          size: 20,
                          color: Color(0xFF1F2D2E),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'SEND INVITATION',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

