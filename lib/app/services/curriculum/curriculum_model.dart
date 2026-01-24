// ✅ Response DTO
class CurriculumResponse {
  final String id;
  final String schoolId;
  final String name;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  CurriculumResponse({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CurriculumResponse.fromJson(Map<String, dynamic> json) =>
      CurriculumResponse(
        id: json['id'],
        schoolId: json['schoolId'],
        name: json['name'],
        isActive: json['isActive'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'schoolId': schoolId,
    'name': name,
    'isActive': isActive,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

// ✅ Request DTO untuk CREATE
class CreateCurriculumRequest {
  final String schoolId;
  final String name;
  final bool? isActive;

  CreateCurriculumRequest({
    required this.schoolId,
    required this.name,
    this.isActive,
  });

  Map<String, dynamic> toJson() => {
    'schoolId': schoolId,
    'name': name,
    if (isActive != null) 'isActive': isActive,
  };
}

// ✅ Request DTO untuk UPDATE
class UpdateCurriculumRequest {
  final String? name;
  final bool? isActive;

  UpdateCurriculumRequest({this.name, this.isActive});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) map['name'] = name;
    if (isActive != null) map['isActive'] = isActive;
    return map;
  }
}
