class SubCurriculumResponse {
  final String id;
  final String curriculumId;
  final String schoolLevelId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubCurriculumResponse({
    required this.id,
    required this.curriculumId,
    required this.schoolLevelId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  // Dari JSON (API/Local Storage) ke Object
  factory SubCurriculumResponse.fromJson(Map<String, dynamic> json) =>
      SubCurriculumResponse(
        id: json["id"],
        curriculumId: json["curriculumId"],
        schoolLevelId: json["schoolLevelId"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // ✅ Method toJson ditambahkan
  Map<String, dynamic> toJson() => {
    "id": id,
    "curriculumId": curriculumId,
    "schoolLevelId": schoolLevelId,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
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
