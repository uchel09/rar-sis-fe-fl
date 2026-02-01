class TeacherSubjectConfigResponse {
  final String id;
  final String teacherId;
  final String subCurriculumSubjectId;
  final DateTime createdAt;
  final DateTime updatedAt;

  TeacherSubjectConfigResponse({
    required this.id,
    required this.teacherId,
    required this.subCurriculumSubjectId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TeacherSubjectConfigResponse.fromJson(Map<String, dynamic> json) =>
      TeacherSubjectConfigResponse(
        id: json["id"],
        teacherId: json["teacherId"],
        subCurriculumSubjectId: json["subCurriculumSubjectId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "teacherId": teacherId,
    "subCurriculumSubjectId": subCurriculumSubjectId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class CreateTeacherSubjectConfigRequest {
  final String teacherId;
  final String subCurriculumSubjectId;

  CreateTeacherSubjectConfigRequest({
    required this.teacherId,
    required this.subCurriculumSubjectId,
  });

  Map<String, dynamic> toJson() => {
    "teacherId": teacherId,
    "subCurriculumSubjectId": subCurriculumSubjectId,
  };
}

class UpdateTeacherSubjectConfigRequest {
  final String? teacherId;
  final String? subCurriculumSubjectId;

  UpdateTeacherSubjectConfigRequest({
    this.teacherId,
    this.subCurriculumSubjectId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (teacherId != null) data["teacherId"] = teacherId;
    if (subCurriculumSubjectId != null) {
      data["subCurriculumSubjectId"] = subCurriculumSubjectId;
    }
    return data;
  }
}
