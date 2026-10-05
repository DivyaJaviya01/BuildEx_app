// Mirrors projects table. Static only.
class ProjectModel {
  final String projectId;
  final String name;
  final String location;
  final double overallProgress;
  const ProjectModel({required this.projectId, required this.name, required this.location, this.overallProgress = 0});
  factory ProjectModel.fromJson(Map<String, dynamic> j) => ProjectModel(
        projectId: j['project_id'] as String,
        name: j['name'] as String,
        location: j['location'] as String,
        overallProgress: (j['overall_progress'] as num? ?? 0).toDouble(),
      );
  Map<String, dynamic> toJson() => {'project_id': projectId, 'name': name, 'location': location, 'overall_progress': overallProgress};
}
