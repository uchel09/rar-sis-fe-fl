// ✅ Request untuk CREATE
class CreateSchoolLevelRequest {
  final String schoolId;
  final String name;
  final bool isActive;
  final bool isMajor;
  final bool isEnrollmentNumber;

  CreateSchoolLevelRequest({
    required this.schoolId,
    required this.name,
    required this.isActive,
    required this.isMajor,
    required this.isEnrollmentNumber,
  });

  Map<String, dynamic> toJson() => {
    'schoolId': schoolId,
    'name': name,
    'isActive': isActive,
    'isMajor': isMajor,
    'isEnrollmentNumber': isEnrollmentNumber,
  };
}

// ✅ Request untuk UPDATE (Semua Optional ?)
class UpdateSchoolLevelRequest {
  final String? name;
  final bool? isActive;
  final bool? isMajor;
  final bool? isEnrollmentNumber;

  UpdateSchoolLevelRequest({
    this.name,
    this.isActive,
    this.isMajor,
    this.isEnrollmentNumber,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) map['name'] = name;
    if (isActive != null) map['isActive'] = isActive;
    if (isMajor != null) map['isMajor'] = isMajor;
    if (isEnrollmentNumber != null)
      map['isEnrollmentNumber'] = isEnrollmentNumber;
    return map;
  }
}

class SchoolLevelResponse {
  final String id;
  final String schoolId;
  final String name;
  final bool isActive;
  final bool isMajor;
  final bool isEnrollmentNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  SchoolLevelResponse({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.isActive,
    required this.isMajor,
    required this.isEnrollmentNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SchoolLevelResponse.fromJson(Map<String, dynamic> json) =>
      SchoolLevelResponse(
        id: json['id'],
        schoolId: json['schoolId'],
        name: json['name'],
        isActive: json['isActive'],
        isMajor: json['isMajor'],
        isEnrollmentNumber: json['isEnrollmentNumber'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'schoolId': schoolId,
    'name': name,
    'isActive': isActive,
    'isMajor': isMajor,
    'isEnrollmentNumber': isEnrollmentNumber,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}
