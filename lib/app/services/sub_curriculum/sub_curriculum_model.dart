class SubCurriculumResponse {
  final String id;
  final String curriculumId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  // Ubah String schoolLevelId menjadi class SchoolLevel
  final SchoolLevel schoolLevel;

  SubCurriculumResponse({
    required this.id,
    required this.curriculumId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.schoolLevel,
  });

  factory SubCurriculumResponse.fromJson(Map<String, dynamic> json) =>
      SubCurriculumResponse(
        id: json["id"],
        curriculumId: json["curriculumId"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        // Parsing nested object schoolLevel
        schoolLevel: SchoolLevel.fromJson(json["schoolLevel"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "curriculumId": curriculumId,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "schoolLevel": schoolLevel.toJson(),
  };
}

// Tambahkan class pendukung untuk SchoolLevel
class SchoolLevel {
  final String id;
  final String name;

  SchoolLevel({required this.id, required this.name});

  factory SchoolLevel.fromJson(Map<String, dynamic> json) =>
      SchoolLevel(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class CreateSubCurriculumRequest {
  final String curriculumId;
  final String schoolLevelId;
  final String name;

  CreateSubCurriculumRequest({
    required this.curriculumId,
    required this.schoolLevelId,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    "curriculumId": curriculumId,
    "schoolLevelId": schoolLevelId,
    "name": name,
  };
}

class UpdateSubCurriculumRequest {
  final String? curriculumId;
  final String? schoolLevelId;
  final String? name;

  UpdateSubCurriculumRequest({
    this.curriculumId,
    this.schoolLevelId,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (curriculumId != null) data["curriculumId"] = curriculumId;
    if (schoolLevelId != null) data["schoolLevelId"] = schoolLevelId;
    if (name != null) data["name"] = name;
    return data;
  }
}
