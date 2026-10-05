// Mirrors daily_attendance table. Static only.
class AttendanceModel {
  final String attendanceId;
  final String workerName;
  final bool isPresent;
  const AttendanceModel({required this.attendanceId, required this.workerName, this.isPresent = false});
  factory AttendanceModel.fromJson(Map<String, dynamic> j) => AttendanceModel(
        attendanceId: j['attendance_id'] as String,
        workerName: j['worker_name'] as String,
        isPresent: j['is_present'] as bool? ?? false,
      );
  Map<String, dynamic> toJson() => {'attendance_id': attendanceId, 'worker_name': workerName, 'is_present': isPresent};
}
