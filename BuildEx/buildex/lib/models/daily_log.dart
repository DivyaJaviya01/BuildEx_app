// Mirrors daily_logs table. Static only.
class DailyLogModel {
  final String logId;
  final String notes;
  final double machineryHours;
  const DailyLogModel({required this.logId, this.notes = '', this.machineryHours = 0});
  factory DailyLogModel.fromJson(Map<String, dynamic> j) => DailyLogModel(
        logId: j['log_id'] as String,
        notes: j['notes'] as String? ?? '',
        machineryHours: (j['machinery_hours'] as num? ?? 0).toDouble(),
      );
  Map<String, dynamic> toJson() => {'log_id': logId, 'notes': notes, 'machinery_hours': machineryHours};
}
