import 'package:rar_sis_fe_fl/app/core/enum.dart';

class ClassResponse {
  final String id;
  final String schoolId;
  final String schoolLevelId;
  final String? majorId;
  final String? homeroomTeacherId;
  final String? homeroomTeacherName;
  final String subCurriculumId;
  final String name;
  final int capacity;
  final Grade grade; // String sesuai enum di Prisma
  final bool isActive;
  final int studentCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClassResponse({
    required this.id,
    required this.schoolId,
    required this.schoolLevelId,
    this.majorId,
    this.homeroomTeacherId,
    this.homeroomTeacherName,
    required this.subCurriculumId,
    required this.name,
    required this.capacity,
    required this.grade,
    required this.isActive,
    required this.studentCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClassResponse.fromJson(Map<String, dynamic> json) {
    return ClassResponse(
      id: json['id'],
      schoolId: json['schoolId'],
      schoolLevelId: json['schoolLevelId'],
      majorId: json['majorId'],
      homeroomTeacherId: json['homeroomTeacherId'],
      homeroomTeacherName: json['homeroomTeacherName'],
      subCurriculumId: json['subCurriculumId'],
      name: json['name'],
      capacity: json['capacity'],
      grade: Grade.values.byName(json['grade']),
      isActive: json['isActive'],
      studentCount: json['studentCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'schoolId': schoolId,
    'schoolLevelId': schoolLevelId,
    'majorId': majorId,
    'homeroomTeacherId': homeroomTeacherId,
    'homeroomTeacherName': homeroomTeacherName,
    'subCurriculumId': subCurriculumId,
    'name': name,
    'capacity': capacity,
    'grade': grade.name,
    'isActive': isActive,
    'studentCount': studentCount,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class CreateClassRequest {
  final String schoolId;
  final String schoolLevelId;
  final String? majorId;
  final String subCurriculumId;
  final String name;
  final int capacity;
  final Grade grade;
  final bool isActive;

  CreateClassRequest({
    required this.schoolId,
    required this.schoolLevelId,
    this.majorId,
    required this.subCurriculumId,
    required this.name,
    required this.capacity,
    required this.grade,
    required this.isActive,
  });

  Map<String, dynamic> toJson() => {
    'schoolId': schoolId,
    'schoolLevelId': schoolLevelId,
    'majorId': majorId,
    'subCurriculumId': subCurriculumId,
    'name': name,
    'capacity': capacity,
    'grade': grade.name,
    'isActive': isActive,
  };
}

class UpdateClassRequest {
  final String? homeroomTeacherId;
  final String? name;
  final int? capacity;
  final String? subCurriculumId;
  final Grade? grade;
  final bool? isActive;

  UpdateClassRequest({
    this.homeroomTeacherId,
    this.name,
    this.capacity,
    this.subCurriculumId,
    this.grade,
    this.isActive,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (homeroomTeacherId != null)
      data['homeroomTeacherId'] = homeroomTeacherId;
    if (name != null) data['name'] = name;
    if (capacity != null) data['capacity'] = capacity;
    if (subCurriculumId != null) data['subCurriculumId'] = subCurriculumId;
    if (grade != null) data['grade'] = grade!.name;
    if (isActive != null) data['isActive'] = isActive;
    return data;
  }
}
