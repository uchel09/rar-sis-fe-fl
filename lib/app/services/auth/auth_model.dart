// lib/app/data/models/user_model.dart

class UserProfileModel {
  final String id;
  final String email;
  final String fullName;
  final String gender;
  final String role;
  final String? imageUrl;
  final DateTime? createdAt;
  final Map<String, dynamic>?
  profile; // Menyimpan data spesifik role (student/teacher/dll)

  UserProfileModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.gender,
    required this.role,
    this.imageUrl,
    this.createdAt,
    this.profile,
  });

  // --- MAPPING MANUAL DARI JSON NESTJS ---
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      gender: json['gender'] ?? '',
      role: json['role'] ?? '',
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      // Mengambil data profile spesifik (student/teacher/staff sesuai switch case NestJS kamu)
      profile: json['profile'] != null
          ? Map<String, dynamic>.from(json['profile'])
          : null,
    );
  }
}
