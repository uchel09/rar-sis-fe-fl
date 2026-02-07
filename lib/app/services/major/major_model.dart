class MajorResponse {
  final String id;
  final String name;
  final String schoolId;
  final String schoolLevelId;
  final String code;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  MajorResponse({
    required this.id,
    required this.name,
    required this.schoolId,
    required this.schoolLevelId,
    required this.code,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MajorResponse.fromJson(Map<String, dynamic> json) => MajorResponse(
    id: json['id'],
    name: json['name'],
    schoolId: json['schoolId'],
    schoolLevelId: json['schoolLevelId'],
    code: json['code'],
    isActive: json['isActive'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'schoolId': schoolId,
    'schoolLevelId': schoolLevelId,
    'code': code,
    'isActive': isActive,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class CreateMajorRequest {
  final String name;
  final String code;
  final String schoolId;
  final String schoolLevelId;
  final bool isActive;

  CreateMajorRequest({
    required this.name,
    required this.code,
    required this.schoolId,
    required this.schoolLevelId,
    this.isActive = true,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'schoolId': schoolId,
    'schoolLevelId': schoolLevelId,
    'isActive': isActive,
  };
}

class UpdateMajorRequest {
  final String? name;
  final String? code;
  final String? schoolId;
  final String? schoolLevelId;
  final bool? isActive;

  UpdateMajorRequest({
    this.name,
    this.code,
    this.schoolId,
    this.schoolLevelId,
    this.isActive,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (code != null) data['code'] = code;
    if (schoolId != null) data['schoolId'] = schoolId;
    if (schoolLevelId != null) data['schoolLevelId'] = schoolLevelId;
    if (isActive != null) data['isActive'] = isActive;
    return data;
  }
}
