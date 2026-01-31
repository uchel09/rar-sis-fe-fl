// ================= ENUM =================
import '../../core/enum.dart';

// ================= SUB MODELS =================

class ParentModel {
  final String? id;
  final String fullName;
  final String email;
  final Gender gender;
  final String phone;
  final String address;
  final String dob;
  final String birthPlace;
  final String nik;

  ParentModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.address,
    required this.dob,
    required this.birthPlace,
    required this.nik,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      gender: Gender.values.byName(json['gender']),
      phone: json['phone'],
      address: json['address'],
      dob: json['dob'],
      birthPlace: json['birthPlace'],
      nik: json['nik'],
    );
  }
}

class AcademicYearModel {
  final String id;
  final String name;

  AcademicYearModel({required this.id, required this.name});

  factory AcademicYearModel.fromJson(Map<String, dynamic> json) {
    return AcademicYearModel(id: json['id'], name: json['name']);
  }
}

class TargetClassModel {
  final String id;
  final String name;
  final Grade grade;

  TargetClassModel({required this.id, required this.name, required this.grade});

  factory TargetClassModel.fromJson(Map<String, dynamic> json) {
    return TargetClassModel(
      id: json['id'],
      name: json['name'],
      grade: Grade.values.byName(json['grade']),
    );
  }
}

// ================= MAIN DATA =================

class StudentDraftModel {
  final String id;
  final String fullName;
  final String email;
  final String address;
  final DateTime dob;
  final String birthPlace;
  final Gender gender;
  final Grade grade;
  final String? previousSchool;
  final bool isInternal;
  final String? enrollmentNumber;
  final String? fileUrl;

  final List<ParentModel> parents;

  final String schoolId;
  final String schoolLevelId;
  final String? majorId;
  final String? studentId;

  final AcademicYearModel academicYear;
  final TargetClassModel? targetClass;

  final String registrationCode;
  final String? pendingSelectionId;
  final int pendingPosition;
  final String testScore;
  final String? paymentAttachment;
  final String? treasurerId;
  final StudentPaymentStatus paymentStatus;

  final DraftStatus status;

  final String? createdBy;
  final String? verifiedByAdmin;
  final String? verifiedByTeacher;
  final String? verifiedByStaff;
  final DateTime? verifiedStaffAt;
  final DateTime? verifiedAdminAt;
  final DateTime? verifiedTeacherAt;
  final String? rejectionReason;

  final DateTime createdAt;
  final DateTime updatedAt;

  StudentDraftModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.dob,
    required this.birthPlace,
    required this.gender,
    required this.grade,
    this.previousSchool,
    required this.isInternal,
    this.enrollmentNumber,
    this.fileUrl,
    required this.parents,
    required this.schoolId,
    required this.schoolLevelId,
    this.majorId,
    this.studentId,
    required this.academicYear,
    this.targetClass,
    required this.registrationCode,
    this.pendingSelectionId,
    required this.pendingPosition,
    required this.testScore,
    this.paymentAttachment,
    this.treasurerId,
    required this.paymentStatus,
    required this.status,
    this.createdBy,
    this.verifiedByAdmin,
    this.verifiedByTeacher,
    this.verifiedByStaff,
    this.verifiedAdminAt,
    this.verifiedTeacherAt,
    this.verifiedStaffAt,
    this.rejectionReason,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentDraftModel.fromJson(Map<String, dynamic> json) {
    return StudentDraftModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      dob: DateTime.parse(json['dob']),
      birthPlace: json['birthPlace'],
      gender: Gender.values.byName(json['gender']),
      grade: Grade.values.byName(json['grade']),
      previousSchool: json['previousSchool'],
      isInternal: json['isInternal'],
      enrollmentNumber: json['enrollmentNumber'],
      fileUrl: json['fileUrl'],

      parents: (json['parents'] as List)
          .map((e) => ParentModel.fromJson(e))
          .toList(),

      schoolId: json['schoolId'],
      schoolLevelId: json['schoolLevelId'],
      majorId: json['majorId'],
      studentId: json['studentId'],

      academicYear: AcademicYearModel.fromJson(json['academicYear']),
      targetClass: json['targetClass'] != null
          ? TargetClassModel.fromJson(json['targetClass'])
          : null,

      registrationCode: json['registrationCode'],
      pendingSelectionId: json['pendingSelectionId'],
      pendingPosition: json['pendingPosition'],
      testScore: json['testScore'],
      paymentAttachment: json['paymentAttachment'],
      treasurerId: json['treasurerId'],
      paymentStatus: StudentPaymentStatus.values.byName(json['paymentStatus']),

      status: DraftStatus.values.byName(json['status']),

      createdBy: json['createdBy'],
      verifiedByAdmin: json['verifiedByAdmin'],
      verifiedByTeacher: json['verifiedByTeacher'],
      verifiedByStaff: json['verifiedByStaff'],
      verifiedTeacherAt: json['verifiedTeacherAt'] != null
          ? DateTime.parse(json['verifiedTeacherAt'])
          : null,
      verifiedStaffAt: json['verifiedStaffAt'] != null
          ? DateTime.parse(json['verifiedStaffAt'])
          : null,
      verifiedAdminAt: json['verifiedAdminAt'] != null
          ? DateTime.parse(json['verifiedAdminAt'])
          : null,
      rejectionReason: json['rejectionReason'],

      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

// ================= PAGINATION WRAPPER =================

class StudentDraftPaginationResponse {
  final List<StudentDraftModel> data;

  final int totalData;
  final int perPage;
  final int currentPage;
  final int lastPage;
  final bool hasNextPage;
  final bool hasPreviousPage;

  StudentDraftPaginationResponse({
    required this.data,
    required this.totalData,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory StudentDraftPaginationResponse.fromJson(Map<String, dynamic> json) {
    final count = json['count'];

    return StudentDraftPaginationResponse(
      data: (json['data'] as List)
          .map((e) => StudentDraftModel.fromJson(e))
          .toList(),
      totalData: count['totalData'],
      perPage: count['perPage'],
      currentPage: count['currentPage'],
      lastPage: count['lastPage'],
      hasNextPage: count['hasNextPage'],
      hasPreviousPage: count['hasPreviousPage'],
    );
  }
}
