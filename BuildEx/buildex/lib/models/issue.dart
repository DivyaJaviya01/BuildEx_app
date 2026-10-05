// Mirrors site_issues table. Static only.
class IssueModel {
  final String issueId;
  final String title;
  final String severity; // LOW | MEDIUM | HIGH
  final String status; // OPEN | RESOLVED | CLOSED
  const IssueModel({required this.issueId, required this.title, this.severity = 'LOW', this.status = 'OPEN'});
  factory IssueModel.fromJson(Map<String, dynamic> j) => IssueModel(
        issueId: j['issue_id'] as String,
        title: j['title'] as String,
        severity: j['severity'] as String? ?? 'LOW',
        status: j['status'] as String? ?? 'OPEN',
      );
  Map<String, dynamic> toJson() => {'issue_id': issueId, 'title': title, 'severity': severity, 'status': status};
}
