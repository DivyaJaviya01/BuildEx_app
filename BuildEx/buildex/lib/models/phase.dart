// Mirrors phases + sub_phases tables. Static only.
class PhaseModel {
  final String phaseId;
  final String name;
  final double progressPercent;
  const PhaseModel({required this.phaseId, required this.name, this.progressPercent = 0});
  factory PhaseModel.fromJson(Map<String, dynamic> j) => PhaseModel(
        phaseId: j['phase_id'] as String,
        name: j['name'] as String,
        progressPercent: (j['progress_percent'] as num? ?? 0).toDouble(),
      );
  Map<String, dynamic> toJson() => {'phase_id': phaseId, 'name': name, 'progress_percent': progressPercent};
}

class SubPhaseModel {
  final String subPhaseId;
  final String name;
  final bool isCompleted;
  const SubPhaseModel({required this.subPhaseId, required this.name, this.isCompleted = false});
  factory SubPhaseModel.fromJson(Map<String, dynamic> j) => SubPhaseModel(
        subPhaseId: j['sub_phase_id'] as String,
        name: j['name'] as String,
        isCompleted: j['is_completed'] as bool? ?? false,
      );
  Map<String, dynamic> toJson() => {'sub_phase_id': subPhaseId, 'name': name, 'is_completed': isCompleted};
}
