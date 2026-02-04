import 'dart:convert';

class TeacherSubjectResponse {
  final String id;
  final String teacherId;
  final String teacherName; // Dari mapping manual NestJS
  final String subjectId;
  final String subjectName; // Dari mapping manual NestJS
  final String subjectSubName; // Dari mapping manual NestJS
  final String? parentId; // Bisa null sesuai update terakhir Anda
  final List<TeacherSubjectResponse> children; // Mapping recursive
  final DateTime createdAt;
  final DateTime updatedAt;

  TeacherSubjectResponse({
    required this.id,
    required this.teacherId,
    required this.teacherName,
    required this.subjectId,
    required this.subjectName,
    required this.subjectSubName,
    this.parentId,
    required this.children,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TeacherSubjectResponse.fromJson(Map<String, dynamic> json) {
    return TeacherSubjectResponse(
      id: json['id'],
      teacherId: json['teacherId'],
      // Pastikan backend kirim string kosong jika null (sesuai mapping manual Anda)
      teacherName: json['teacherName'] ?? "",
      subjectId: json['subjectId'],
      subjectName: json['subjectName'] ?? "",
      subjectSubName: json['subjectSubName'] ?? "",
      parentId: json['parentId'], // Biarkan null jika dari backend null
      // Handle rekursi untuk children
      children: (json['children'] as List? ?? [])
          .map((child) => TeacherSubjectResponse.fromJson(child))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacherId': teacherId,
      'teacherName': teacherName,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'subjectSubName': subjectSubName,
      'parentId': parentId,
      'children': children.map((v) => v.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class CreateTeacherSubjectRequest {
  final String teacherId;
  final String subjectId;
  final String? parentId;

  CreateTeacherSubjectRequest({
    required this.teacherId,
    required this.subjectId,
    this.parentId,
  });

  Map<String, dynamic> toJson() => {
    'teacherId': teacherId,
    'subjectId': subjectId,
    'parentId': parentId,
  };
}

class UpdateTeacherSubjectRequest {
  final String? teacherId;
  final String? subjectId;
  final String? parentId;

  UpdateTeacherSubjectRequest({this.teacherId, this.subjectId, this.parentId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (teacherId != null) data['teacherId'] = teacherId;
    if (subjectId != null) data['subjectId'] = subjectId;
    data['parentId'] = parentId;
    return data;
  }
}
