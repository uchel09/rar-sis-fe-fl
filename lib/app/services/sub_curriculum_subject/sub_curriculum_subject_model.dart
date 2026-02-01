import '../../core/enum.dart'; // Pastikan Grade enum ada di sini

class SubCurriculumSubjectResponse {
  final String id;
  final String subjectId;
  final String subCurriculumId;
  final Grade grade;
  final dynamic syllabus;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubCurriculumSubjectResponse({
    required this.id,
    required this.subjectId,
    required this.subCurriculumId,
    required this.grade,
    this.syllabus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCurriculumSubjectResponse.fromJson(Map<String, dynamic> json) =>
      SubCurriculumSubjectResponse(
        id: json["id"],
        subjectId: json["subjectId"],
        subCurriculumId: json["subCurriculumId"],
        grade: Grade.values.byName(json["grade"]),
        syllabus: json["syllabus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subjectId": subjectId,
    "subCurriculumId": subCurriculumId,
    "grade": grade.name,
    "syllabus": syllabus,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class CreateSubCurriculumSubjectRequest {
  final String subjectId;
  final String subCurriculumId;
  final Grade grade;

  CreateSubCurriculumSubjectRequest({
    required this.subjectId,
    required this.subCurriculumId,
    required this.grade,
  });

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId,
    "subCurriculumId": subCurriculumId,
    "grade": grade.name,
  };
}

class UpdateSubCurriculumSubjectRequest {
  final String? subjectId;
  final String? subCurriculumId;
  final Grade? grade;
  final dynamic syllabus;

  UpdateSubCurriculumSubjectRequest({
    this.subjectId,
    this.subCurriculumId,
    this.grade,
    this.syllabus,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (subjectId != null) data["subjectId"] = subjectId;
    if (subCurriculumId != null) data["subCurriculumId"] = subCurriculumId;
    if (grade != null) data["grade"] = grade!.name;
    if (syllabus != null) data["syllabus"] = syllabus;
    return data;
  }
}
