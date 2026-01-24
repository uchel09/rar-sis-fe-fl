import 'package:rar_sis_fe_fl/app/core/enum.dart';

class CreateSchoolAdminRequest {
  // user
  final String email;
  final String fullName;
  final Gender gender;
  final String address;
  //profile data
  final String schoolId;
  final DateTime dob;
  final String birthPlace;
  final String nik;
  final DateTime hireDate;
  final String phone;
  final bool isHonor;
  final List<String> schoolLevelAccessIds;

  CreateSchoolAdminRequest({
    // user
    required this.email,
    required this.fullName,
    required this.gender,
    required this.address,
    //profile data
    required this.schoolId,
    required this.dob,
    required this.birthPlace,
    required this.nik,
    required this.hireDate,
    required this.phone,
    required this.isHonor,
    required this.schoolLevelAccessIds,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "fullName": fullName,
    "gender": gender.name,
    "address": address,
    //==
    "schoolId": schoolId,
    "dob": dob.toIso8601String(),
    "birthPlace": birthPlace,
    "nik": nik,
    "hireDate": hireDate.toIso8601String(),
    "phone": phone,
    "isHonor": isHonor,
    "schoolLevelAccessIds": schoolLevelAccessIds,
  };
}

class UpdateSchoolAdminRequest {
  //user
  final String? fullName;
  final Gender? gender;
  final String? address;
  //profile data
  final DateTime? dob;
  final String? birthPlace;
  final String? nik;
  final String? nip;
  final EmployeeStatus? status;
  final String? phone;
  final bool? isHonor;
  final List<String>? schoolLevelAccessIds;

  UpdateSchoolAdminRequest({
    this.fullName,
    this.gender,
    this.address,

    this.dob,
    this.birthPlace,
    this.nik,
    this.nip,
    this.status,
    this.phone,
    this.isHonor,
    this.schoolLevelAccessIds,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (fullName != null) data['fullName'] = fullName;
    if (gender != null) data['gender'] = gender!.name;
    if (address != null) data['address'] = address;
    //profile data
    if (dob != null) data['dob'] = dob!.toIso8601String();
    if (birthPlace != null) data['birthPlace'] = birthPlace;
    if (nik != null) data['nik'] = nik;
    if (nip != null) data['nip'] = nip;
    if (status != null) data['status'] = status!.name;
    if (phone != null) data['phone'] = phone;
    if (isHonor != null) data['isHonor'] = isHonor;
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
  final String? nip;
  final EmployeeStatus status;
  final DateTime hireDate;
  final String phone;
  final bool isHonor;

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
    this.nip,
    required this.status,
    required this.hireDate,
    required this.phone,
    required this.isHonor,
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
        nip: json["nip"],
        status: EmployeeStatus.values.byName(json["status"]),
        hireDate: DateTime.parse(json["hireDate"]),
        phone: json["phone"],
        isHonor: json["isHonor"],
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
    "nip": nip,
    "status": status.name,
    "hireDate": hireDate,
    "phone": phone,
    "isHonor": isHonor,
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
  final Role role;
  final String imageUrl;
  final String fileUrl;
  final String address;

  UserInfo({
    required this.id,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.role,
    required this.imageUrl,
    required this.fileUrl,
    required this.address,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    gender: Gender.values.byName(json["gender"]),
    role: Role.values.byName(json["role"]),
    imageUrl: json["imageUrl"],
    fileUrl: json["fileUrl"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "gender": gender.name,
    "role": role.name,
    "imageUrl": imageUrl,
    "fileUrl": fileUrl,
    "address": address,
  };
}

class SchoolLevelAccess {
  final String id;
  final String name;

  SchoolLevelAccess({required this.id, required this.name});

  factory SchoolLevelAccess.fromJson(Map<String, dynamic> json) =>
      SchoolLevelAccess(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
