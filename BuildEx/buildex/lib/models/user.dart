// Mirrors users table (system_design/04_class_diagram_database.md:120). Static only.
class UserModel {
  final String userId;
  final String name;
  final String email;
  final String role; // BUILDER | CONTRACTOR
  const UserModel({required this.userId, required this.name, required this.email, required this.role});
  factory UserModel.fromJson(Map<String, dynamic> j) => UserModel(
        userId: j['user_id'] as String,
        name: j['name'] as String,
        email: j['email'] as String,
        role: j['role'] as String,
      );
  Map<String, dynamic> toJson() => {'user_id': userId, 'name': name, 'email': email, 'role': role};
}
