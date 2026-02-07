import 'package:rar_sis_fe_fl/app/core/enum.dart';

// ✅ Request untuk CREATE
class CreateSchoolLevelRequest {
  final String schoolId;
  final String name;
  final bool isActive;
  final bool isMajor;
  final bool isEnrollmentNumber;
  final int totalLevel;
  final SchoolLevelIdentity identity;

  CreateSchoolLevelRequest({
    required this.schoolId,
    required this.name,
    required this.isActive,
    required this.isMajor,
    required this.isEnrollmentNumber,
    required this.totalLevel,
    required this.identity,
  });

  Map<String, dynamic> toJson() => {
    'schoolId': schoolId,
    'name': name,
    'isActive': isActive,
    'isMajor': isMajor,
    'isEnrollmentNumber': isEnrollmentNumber,
    'totalLevel': totalLevel,
    'identity': identity.name, // Mapping Enum ke String
  };
}

// ✅ Request untuk UPDATE
class UpdateSchoolLevelRequest {
  final String? name;
  final bool? isActive;
  final bool? isMajor;
  final bool? isEnrollmentNumber;
  final int? totalLevel;
  final SchoolLevelIdentity? identity;

  UpdateSchoolLevelRequest({
    this.name,
    this.isActive,
    this.isMajor,
    this.isEnrollmentNumber,
    this.totalLevel,
    this.identity,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) map['name'] = name;
    if (isActive != null) map['isActive'] = isActive;
    if (isMajor != null) map['isMajor'] = isMajor;
    if (isEnrollmentNumber != null)
      map['isEnrollmentNumber'] = isEnrollmentNumber;
    if (totalLevel != null) map['totalLevel'] = totalLevel;
    if (identity != null) map['identity'] = identity!.name;
    return map;
  }
}

// ✅ Response
class SchoolLevelResponse {
  final String id;
  final String schoolId;
  final String name;
  final bool isActive;
  final bool isMajor;
  final bool isEnrollmentNumber;
  final int totalLevel;
  final SchoolLevelIdentity identity;
  final DateTime createdAt;
  final DateTime updatedAt;

  SchoolLevelResponse({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.isActive,
    required this.isMajor,
    required this.isEnrollmentNumber,
    required this.totalLevel,
    required this.identity,
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
        totalLevel: json['totalLevel'] ?? 0,
        // Mapping String dari API ke Enum Flutter
        identity: SchoolLevelIdentity.values.byName(json['identity']),
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
    'totalLevel': totalLevel,
    'identity': identity.name,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}
