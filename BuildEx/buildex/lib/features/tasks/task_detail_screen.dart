import 'package:flutter/material.dart';
import '../../resources/theme/app_colors.dart';
import '../../resources/widgets/app_bar.dart';

// Owner: Krisha. Figma: Task Details.
class TaskDetailScreen extends StatefulWidget {
  static const route = '/tasks/detail';
  const TaskDetailScreen({super.key});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final _commentController = TextEditingController();

  bool _isCompleted = false;

  final List<({String title, bool checked})> _checklist = [
    (title: 'Mix proportion verification', checked: true),
    (title: 'Rebar spacing inspection', checked: true),
    (title: 'Slump test check', checked: false),
    (title: 'Concrete pour log submission', checked: false),
  ];

  final List<({String author, String time, String body, bool isUser, String initials, String? avatarUrl})> _comments = [
    (
      author: 'Jane Smith',
      time: '10:42 AM',
      body: 'Rebar looks solid. Waiting on the final slump test results before giving the green light.',
      isUser: false,
      initials: 'JS',
      avatarUrl: 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=150&auto=format&fit=crop&q=80',
    ),
    (
      author: 'Site Builder',
      time: '11:15 AM',
      body: 'Understood. Test team is en route to Pier 45 now.',
      isUser: true,
      initials: 'SB',
      avatarUrl: null,
    ),
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        final now = DateTime.now();
        final hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
        final minute = now.minute.toString().padLeft(2, '0');
        final ampm = now.hour >= 12 ? 'PM' : 'AM';
        final formattedTime = "$hour:$minute $ampm";
        _comments.add((
          author: 'You',
          time: formattedTime,
          body: text,
          isUser: true,
          initials: 'ME',
          avatarUrl: null,
        ));
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFBF9),
      appBar: BuildExAppBar(
        title: 'Task Details',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Task Info Card
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
                          // Category & Status Badge Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'METRO LINE PHASE 2A',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF64748B),
                                  letterSpacing: 0.5,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: _isCompleted ? const Color(0xFFDCFCE7) : const Color(0xFFFDE68A),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ContainerDot(color: _isCompleted ? const Color(0xFF16A34A) : const Color(0xFFF59E0B)),
                                    const SizedBox(width: 5),
                                    Text(
                                      _isCompleted ? 'COMPLETED' : 'IN PROGRESS',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                        color: _isCompleted ? const Color(0xFF16A34A) : const Color(0xFF78350F),
                                        letterSpacing: 0.5,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Title
                          const Text(
                            'Concreting Pier 45',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1E293B),
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Due Date
                          const Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFFDC2626),
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Due Today (Oct 25)',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFDC2626),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // Description Body
                          const Text(
                            'Finalize cement laying and verification for Pier 45 structure. Ensure slump tests are completed before pouring.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF475569),
                              height: 1.45,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Inspection Checklist Header
                    const Row(
                      children: [
                        Icon(
                          Icons.tune_rounded,
                          size: 20,
                          color: Color(0xFF1E293B),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Inspection Checklist',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1E293B),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Inspection Checklist Card Box
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
                      child: Column(
                        children: [
                          for (int i = 0; i < _checklist.length; i++) ...[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _checklist[i] = (
                                    title: _checklist[i].title,
                                    checked: !_checklist[i].checked,
                                  );
                                });
                              },
                              borderRadius: i == 0
                                  ? const BorderRadius.vertical(top: Radius.circular(16))
                                  : (i == _checklist.length - 1
                                      ? const BorderRadius.vertical(bottom: Radius.circular(16))
                                      : BorderRadius.zero),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        color: _checklist[i].checked ? const Color(0xFF0D9488) : Colors.transparent,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: _checklist[i].checked ? const Color(0xFF0D9488) : const Color(0xFFCBD5E1),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: _checklist[i].checked
                                          ? const Icon(Icons.check, size: 16, color: Colors.white)
                                          : null,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        _checklist[i].title,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: _checklist[i].checked ? const Color(0xFF94A3B8) : const Color(0xFF334155),
                                          decoration: _checklist[i].checked ? TextDecoration.lineThrough : null,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (i < _checklist.length - 1)
                              const Divider(color: Color(0xFFF1F5F9), height: 1, thickness: 1),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Activity & Comments Header
                    const Row(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 20,
                          color: Color(0xFF1E293B),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Activity & Comments',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1E293B),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Comment Items List
                    for (final comment in _comments) ...[
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: comment.isUser ? const Color(0xFF0D9488) : const Color(0xFF0284C7),
                                  backgroundImage: comment.avatarUrl != null ? NetworkImage(comment.avatarUrl!) : null,
                                  onBackgroundImageError: comment.avatarUrl != null ? (_, _) {} : null,
                                  child: comment.avatarUrl == null
                                      ? Text(
                                          comment.initials,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                            fontFamily: 'Inter',
                                          ),
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  comment.author,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E293B),
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  comment.time,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF64748B),
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              comment.body,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF475569),
                                height: 1.4,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 4),

                    // Write Comment Input Field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _commentController,
                              style: const TextStyle(fontSize: 14, fontFamily: 'Inter'),
                              decoration: const InputDecoration(
                                hintText: 'Write a message...',
                                hintStyle: TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (_) => _addComment(),
                            ),
                          ),
                          InkWell(
                            onTap: _addComment,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFCCFBF1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.send_rounded,
                                color: Color(0xFF0D9488),
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Bottom Fixed Action Buttons Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // COMPLETE TASK Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: const Color(0xFF1F2D2E),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _isCompleted = !_isCompleted;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_isCompleted ? 'Task marked as COMPLETED!' : 'Task status reset to IN PROGRESS'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle_rounded,
                            size: 20,
                            color: Color(0xFF1F2D2E),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _isCompleted ? 'REOPEN TASK' : 'COMPLETE TASK',
                            style: const TextStyle(
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
                  const SizedBox(height: 10),

                  // REASSIGN TASK Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Reassign task dialog opened'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_horiz_rounded,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'REASSIGN TASK',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.0,
                              color: AppColors.primary,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
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

