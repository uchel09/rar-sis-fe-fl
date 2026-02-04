import 'dart:convert';

class SubCurriculumSubjectResponse {
  final String id;
  final String subjectId;
  final String subjectName;
  final String subCurriculumId;
  final int hoursPerWeek;
  final dynamic syllabus;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubCurriculumSubjectResponse({
    required this.id,
    required this.subjectId,
    required this.subjectName,
    required this.subCurriculumId,
    required this.hoursPerWeek,
    this.syllabus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCurriculumSubjectResponse.fromJson(Map<String, dynamic> json) {
    return SubCurriculumSubjectResponse(
      id: json['id'],
      subjectId: json['subject']['id'],
      subjectName: json['subject']['name'],
      subCurriculumId: json['subCurriculumId'],
      hoursPerWeek: json['hoursPerWeek'],
      syllabus: json['syllabus'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject': {'id': subjectId, 'name': subjectName},
      'subCurriculumId': subCurriculumId,
      'syllabus': syllabus,
      'hoursPerWeek': hoursPerWeek,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class CreateSubCurriculumSubjectRequest {
  final String subjectId;
  final String subCurriculumId;
  final int hoursPerWeek;

  CreateSubCurriculumSubjectRequest({
    required this.subjectId,
    required this.subCurriculumId,
    required this.hoursPerWeek,
  });

  Map<String, dynamic> toJson() => {
    'subjectId': subjectId,
    'subCurriculumId': subCurriculumId,
    'hoursPerWeek': hoursPerWeek,
  };
}

class UpdateSubCurriculumSubjectRequest {
  final String? subjectId;
  final String? subCurriculumId;
  final int? hoursPerWeek;
  final dynamic syllabus;

  UpdateSubCurriculumSubjectRequest({
    this.subjectId,
    this.subCurriculumId,
    this.syllabus,
    this.hoursPerWeek,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (subjectId != null) data['subjectId'] = subjectId;
    if (subCurriculumId != null) data['subCurriculumId'] = subCurriculumId;
    if (hoursPerWeek != null) data['hoursPerWeek'] = hoursPerWeek;
    if (syllabus != null) data['syllabus'] = syllabus;
    return data;
  }
}
