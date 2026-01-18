import 'dart:convert';
import 'package:rar_sis_fe_fl/app/core/enum.dart';

// ==========================================
// 2. REQUEST MODELS
// ==========================================

class CreateSchoolAdminRequest {
  final String email;
  final String password;
  final String fullName;
  final Gender gender;
  final String? imageUrl;
  final String schoolId;
  final DateTime dob;
  final String birthPlace;
  final String nik;
  final List<String> schoolLevelAccessIds;

  CreateSchoolAdminRequest({
    required this.email,
    required this.password,
    required this.fullName,
    required this.gender,
    this.imageUrl,
    required this.schoolId,
    required this.dob,
    required this.birthPlace,
    required this.nik,
    required this.schoolLevelAccessIds,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "fullName": fullName,
    "gender": gender.name,
    "imageUrl": imageUrl ?? "",
    "schoolId": schoolId,
    "dob": dob.toIso8601String(),
    "birthPlace": birthPlace,
    "nik": nik,
    "schoolLevelAccessIds": schoolLevelAccessIds,
  };
}

class UpdateSchoolAdminRequest {
  final String? email;
  final String? password;
  final String? fullName;
  final Gender? gender;
  final String? imageUrl;
  final String? schoolId;
  final DateTime? dob;
  final String? birthPlace;
  final String? nik;
  final EmployeeStatus? status;
  final List<String>? schoolLevelAccessIds;

  UpdateSchoolAdminRequest({
    this.email,
    this.password,
    this.fullName,
    this.gender,
    this.imageUrl,
    this.schoolId,
    this.dob,
    this.birthPlace,
    this.nik,
    this.status,
    this.schoolLevelAccessIds,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;
    if (fullName != null) data['fullName'] = fullName;
    if (gender != null) data['gender'] = gender!.name;
    if (imageUrl != null) data['imageUrl'] = imageUrl;
    if (schoolId != null) data['schoolId'] = schoolId;
    if (dob != null) data['dob'] = dob!.toIso8601String();
    if (birthPlace != null) data['birthPlace'] = birthPlace;
    if (nik != null) data['nik'] = nik;
    if (status != null) data['status'] = status!.name;
    if (schoolLevelAccessIds != null)
      data['schoolLevelAccessIds'] = schoolLevelAccessIds;
    return data;
  }
}

// ==========================================
// 3. RESPONSE MODELS (Updated with toJson)
// ==========================================

class SchoolAdminResponse {
  final String id;
  final String schoolId;
  final DateTime dob;
  final String birthPlace;
  final String nik;
  final EmployeeStatus status;
  final UserInfo user;
  final List<SchoolLevelAccess> schoolLevelAccess;
  final DateTime createdAt;
  final DateTime updatedAt;

  SchoolAdminResponse({
    required this.id,
    required this.schoolId,
    required this.dob,
    required this.birthPlace,
    required this.nik,
    required this.status,
    required this.user,
    required this.schoolLevelAccess,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SchoolAdminResponse.fromJson(Map<String, dynamic> json) =>
      SchoolAdminResponse(
        id: json["id"],
        schoolId: json["schoolId"],
        dob: DateTime.parse(json["dob"]),
        birthPlace: json["birthPlace"],
        nik: json["nik"],
        status: EmployeeStatus.values.byName(json["status"]),
        user: UserInfo.fromJson(json["user"]),
        schoolLevelAccess: List<SchoolLevelAccess>.from(
          json["schoolLevelAccess"].map((x) => SchoolLevelAccess.fromJson(x)),
        ),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  // Method toJson untuk simpan ke GetStorage
  Map<String, dynamic> toJson() => {
    "id": id,
    "schoolId": schoolId,
    "dob": dob.toIso8601String(),
    "birthPlace": birthPlace,
    "nik": nik,
    "status": status.name,
    "user": user.toJson(),
    "schoolLevelAccess": schoolLevelAccess.map((x) => x.toJson()).toList(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class UserInfo {
  final String id;
  final String fullName;
  final String email;
  final Gender gender;
  final String imageUrl;

  UserInfo({
    required this.id,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.imageUrl,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    gender: Gender.values.byName(json["gender"]),
    imageUrl: json["imageUrl"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "gender": gender.name,
    "imageUrl": imageUrl,
  };
}

class SchoolLevelAccess {
  final String id;
  final String name;
  final bool isMajor;
  final bool isEnrollmentNumber;
  final bool isActive;

  SchoolLevelAccess({
    required this.id,
    required this.name,
    required this.isMajor,
    required this.isEnrollmentNumber,
    required this.isActive,
  });

  factory SchoolLevelAccess.fromJson(Map<String, dynamic> json) =>
      SchoolLevelAccess(
        id: json["id"],
        name: json["name"],
        isMajor: json["isMajor"],
        isEnrollmentNumber: json["isEnrollmentNumber"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isMajor": isMajor,
    "isEnrollmentNumber": isEnrollmentNumber,
    "isActive": isActive,
  };
}
