class SubjectResponse {
  final String id;
  final String name;
  final String schoolId;
  final String schoolLevelId;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubjectResponse({
    required this.id,
    required this.name,
    required this.schoolId,
    required this.schoolLevelId,
    required this.createdAt,
    required this.updatedAt,
  });

  // Dari JSON API ke Object
  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      SubjectResponse(
        id: json["id"],
        name: json["name"],
        schoolId: json["schoolId"],
        schoolLevelId: json["schoolLevelId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // ✅ Method toJson ditambahkan sesuai permintaan
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "schoolId": schoolId,
    "schoolLevelId": schoolLevelId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class CreateSubjectRequest {
  final String name;
  final String schoolId;
  final String schoolLevelId;

  CreateSubjectRequest({
    required this.name,
    required this.schoolId,
    required this.schoolLevelId,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "schoolId": schoolId,
    "schoolLevelId": schoolLevelId,
  };
}

class UpdateSubjectRequest {
  final String? name;

  UpdateSubjectRequest({this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data["name"] = name;
    return data;
  }
}
