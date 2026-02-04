class SubjectResponse {
  final String id;
  final String name;
  final String subName;
  final String schoolId;
  final List<SchoolLevelAccess> schoolLevelAccess;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubjectResponse({
    required this.id,
    required this.name,
    required this.subName,
    required this.schoolId,
    required this.schoolLevelAccess,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return SubjectResponse(
      id: json['id'],
      name: json['name'],
      subName: json['subName'],
      schoolId: json['schoolId'],
      schoolLevelAccess: (json['schoolLevelAccess'] as List)
          .map((item) => SchoolLevelAccess.fromJson(item))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subName': subName,
      'schoolId': schoolId,
      'schoolLevelAccess': schoolLevelAccess.map((e) => e.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class SchoolLevelAccess {
  final String id;
  final String name;

  SchoolLevelAccess({required this.id, required this.name});

  factory SchoolLevelAccess.fromJson(Map<String, dynamic> json) {
    return SchoolLevelAccess(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

class CreateSubjectRequest {
  final String name;
  final String subName;
  final String schoolId;
  final List<String> schoolLevelAccessIds;

  CreateSubjectRequest({
    required this.name,
    required this.subName,
    required this.schoolId,
    required this.schoolLevelAccessIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subName': subName,
      'schoolId': schoolId,
      'schoolLevelAccessIds': schoolLevelAccessIds,
    };
  }
}

class UpdateSubjectRequest {
  final String? name;
  final String? subName;
  final List<String>? schoolLevelAccessIds;

  UpdateSubjectRequest({this.name, this.schoolLevelAccessIds, this.subName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (subName != null) data['subName'] = subName;
    if (schoolLevelAccessIds != null)
      data['schoolLevelAccessIds'] = schoolLevelAccessIds;
    return data;
  }
}
