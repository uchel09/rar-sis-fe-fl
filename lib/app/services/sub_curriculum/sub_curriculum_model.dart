class SubCurriculumResponse {
  final String id;
  final String curriculumId;
  final String name;
  final int minutesPerJp;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SchoolLevel schoolLevel;
  // Tambahkan list subjects
  final List<SubCurriculumSubject> subjects;

  SubCurriculumResponse({
    required this.id,
    required this.curriculumId,
    required this.name,
    required this.minutesPerJp,
    required this.createdAt,
    required this.updatedAt,
    required this.schoolLevel,
    required this.subjects,
  });

  factory SubCurriculumResponse.fromJson(Map<String, dynamic> json) =>
      SubCurriculumResponse(
        id: json["id"],
        curriculumId: json["curriculumId"],
        name: json["name"],
        minutesPerJp: json["minutesPerJp"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        schoolLevel: SchoolLevel.fromJson(json["schoolLevel"]),
        // Parsing list subjects dengan aman
        subjects: List<SubCurriculumSubject>.from(
          (json["subjects"] ?? []).map((x) => SubCurriculumSubject.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "curriculumId": curriculumId,
    "name": name,
    "minutesPerJp": minutesPerJp,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "schoolLevel": schoolLevel.toJson(),
    "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
  };
}

class SchoolLevel {
  final String id;
  final String name;

  SchoolLevel({required this.id, required this.name});

  factory SchoolLevel.fromJson(Map<String, dynamic> json) =>
      SchoolLevel(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

// Tambahkan class untuk item subject sesuai mapping NestJS kita
class SubCurriculumSubject {
  final String id; // Ini ID Pivot
  final String subjectId; // Ini ID Master
  final String subjectName;
  final int hoursPerWeek;
  final dynamic syllabus; // Pakai dynamic karena tipe Json di backend

  SubCurriculumSubject({
    required this.id,
    required this.subjectId,
    required this.subjectName,
    required this.hoursPerWeek,
    this.syllabus,
  });

  factory SubCurriculumSubject.fromJson(Map<String, dynamic> json) =>
      SubCurriculumSubject(
        id: json["id"],
        subjectId: json["subjectId"],
        subjectName: json["subjectName"],
        hoursPerWeek: json["hoursPerWeek"],
        syllabus: json["syllabus"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subjectId": subjectId,
    "subjectName": subjectName,
    "hoursPerWeek": hoursPerWeek,
    "syllabus": syllabus,
  };
}

class CreateSubCurriculumRequest {
  final String curriculumId;
  final String schoolLevelId;
  final String name;
  final int minutesPerJp;

  CreateSubCurriculumRequest({
    required this.curriculumId,
    required this.schoolLevelId,
    required this.name,
    required this.minutesPerJp,
  });

  Map<String, dynamic> toJson() => {
    "curriculumId": curriculumId,
    "schoolLevelId": schoolLevelId,
    "name": name,
    "minutesPerJp": minutesPerJp,
  };
}

class UpdateSubCurriculumRequest {
  final String? curriculumId;
  final String? schoolLevelId;
  final String? name;
  final int? minutesPerJp;

  UpdateSubCurriculumRequest({
    this.curriculumId,
    this.schoolLevelId,
    this.name,
    this.minutesPerJp,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (curriculumId != null) data["curriculumId"] = curriculumId;
    if (schoolLevelId != null) data["schoolLevelId"] = schoolLevelId;
    if (name != null) data["name"] = name;
    if (minutesPerJp != null) data["minutesPerJp"] = minutesPerJp;
    return data;
  }
}

class BulkAssignSubjectRequest {
  final String subCurriculumId;
  final List<SubjectAssignItem> subjects;

  BulkAssignSubjectRequest({
    required this.subCurriculumId,
    required this.subjects,
  });

  Map<String, dynamic> toJson() => {
    "subCurriculumId": subCurriculumId,
    "subjects": subjects.map((x) => x.toJson()).toList(),
  };
}

class SubjectAssignItem {
  final String subjectId;
  final int hoursPerWeek;

  SubjectAssignItem({required this.subjectId, required this.hoursPerWeek});

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId,
    "hoursPerWeek": hoursPerWeek,
  };
}
