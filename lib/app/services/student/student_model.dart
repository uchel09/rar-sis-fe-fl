class StudentResponse {
  final String userId;
  final String email;
  final String fullName;
  final String gender; // Gender Enum dari Prisma
  final String role; // Role Enum dari Prisma
  final String imageUrl;
  final String fileUrl;
  final String address;
  final String id;
  final String? majorId;
  final String schoolId;
  final String schoolLevelId;
  final String? classId;
  final String? enrollmentNumber;
  final DateTime dob;
  final String birthPlace;
  final String grade; // Grade Enum dari Prisma
  final String status; // StudentStatus Enum dari Prisma
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentResponse({
    required this.userId,
    required this.email,
    required this.fullName,
    required this.gender,
    required this.role,
    required this.imageUrl,
    required this.fileUrl,
    required this.address,
    required this.id,
    this.majorId,
    required this.schoolId,
    required this.schoolLevelId,
    this.classId,
    this.enrollmentNumber,
    required this.dob,
    required this.birthPlace,
    required this.grade,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentResponse.fromJson(Map<String, dynamic> json) =>
      StudentResponse(
        userId: json['userId'],
        email: json['email'],
        fullName: json['fullName'],
        gender: json['gender'],
        role: json['role'],
        imageUrl: json['imageUrl'],
        fileUrl: json['fileUrl'],
        address: json['address'],
        id: json['id'],
        majorId: json['majorId'],
        schoolId: json['schoolId'],
        schoolLevelId: json['schoolLevelId'],
        classId: json['classId'],
        enrollmentNumber: json['enrollmentNumber'],
        dob: DateTime.parse(json['dob']),
        birthPlace: json['birthPlace'],
        grade: json['grade'],
        status: json['status'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'email': email,
    'fullName': fullName,
    'gender': gender,
    'role': role,
    'imageUrl': imageUrl,
    'fileUrl': fileUrl,
    'address': address,
    'id': id,
    'majorId': majorId,
    'schoolId': schoolId,
    'schoolLevelId': schoolLevelId,
    'classId': classId,
    'enrollmentNumber': enrollmentNumber,
    'dob': dob.toIso8601String(),
    'birthPlace': birthPlace,
    'grade': grade,
    'status': status,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class CreateStudentRequest {
  final String fullName;
  final String email;
  final String gender;
  final String address;
  final String schoolId;
  final String schoolLevelId;
  final String? majorId;
  final String? classId;
  final String? enrollmentNumber;
  final DateTime dob;
  final String birthPlace;
  final String grade;

  CreateStudentRequest({
    required this.fullName,
    required this.email,
    required this.gender,
    required this.address,
    required this.schoolId,
    required this.schoolLevelId,
    this.majorId,
    this.classId,
    this.enrollmentNumber,
    required this.dob,
    required this.birthPlace,
    required this.grade,
  });

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'email': email,
    'gender': gender,
    'address': address,
    'schoolId': schoolId,
    'schoolLevelId': schoolLevelId,
    'majorId': majorId,
    'classId': classId,
    'enrollmentNumber': enrollmentNumber,
    'dob': dob.toIso8601String(),
    'birthPlace': birthPlace,
    'grade': grade,
  };
}

class UpdateStudentRequest {
  final String? fullName;
  final String? gender;
  final String? address;
  final String? schoolLevelId;
  final String? majorId;
  final String? classId;
  final String? grade;
  final String? enrollmentNumber;
  final DateTime? dob;
  final String? birthPlace;
  final String? status;

  UpdateStudentRequest({
    this.fullName,
    this.gender,
    this.address,
    this.schoolLevelId,
    this.majorId,
    this.classId,
    this.grade,
    this.enrollmentNumber,
    this.dob,
    this.birthPlace,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (fullName != null) data['fullName'] = fullName;
    if (gender != null) data['gender'] = gender;
    if (address != null) data['address'] = address;
    if (schoolLevelId != null) data['schoolLevelId'] = schoolLevelId;
    if (majorId != null) data['majorId'] = majorId;
    if (classId != null) data['classId'] = classId;
    if (grade != null) data['grade'] = grade;
    if (enrollmentNumber != null) data['enrollmentNumber'] = enrollmentNumber;
    if (dob != null) data['dob'] = dob!.toIso8601String();
    if (birthPlace != null) data['birthPlace'] = birthPlace;
    if (status != null) data['status'] = status;
    return data;
  }
}
