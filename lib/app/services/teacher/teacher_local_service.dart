import 'dart:convert';
import '../../core/enum.dart';
import '../db/database.dart';
import 'teacher_model.dart';
import 'package:drift/drift.dart';

class TeacherLocalService {
  final AppDatabase _db;
  TeacherLocalService(this._db);

  /// BULK INSERT: Clear dulu baru isi, dibungkus Transaction agar aman
  Future<void> bulkInsert(List<TeacherResponse> admins) async {
    await _db.transaction(() async {
      // 1. Bersihkan tabel
      await _db.delete(_db.schoolAdmins).go();

      // 2. Batch insert data baru
      await _db.batch((batch) {
        for (final admin in admins) {
          batch.insert(_db.schoolAdmins, _mapToCompanion(admin));
        }
      });
    });
  }

  /// MANUAL MAPPING: Response API -> Drift Companion
  TeachersCompanion _mapToCompanion(TeacherResponse res) {
    return TeachersCompanion.insert(
      id: res.id,
      schoolId: res.schoolId,
      dob: res.dob,
      birthPlace: res.birthPlace,
      nik: res.nik,
      // Gunakan Value() agar jika null tidak error di Drift
      nip: res.nip != null ? Value(res.nip) : const Value.absent(),

      // Sinkronkan dengan Enum terbaru
      employeeType: res.employeeType.name,
      workStatus: res.workStatus.name,
      employeeEndStatus: res.employeeEndStatus.name,

      hireEnd: res.hireEnd != null ? Value(res.hireEnd) : const Value.absent(),

      hireDate: res.hireDate,
      phone: res.phone,

      // Mapping UserInfo (Denormalisasi)
      userId: res.user.id,
      fullName: res.user.fullName,
      email: res.user.email,
      gender: res.user.gender.name,
      role: res.user.role.name,
      imageUrl: res.user.imageUrl, // URL gambar JPG
      fileUrl: res.user.fileUrl,
      address: res.user.address,

      // List ke JSON String
      schoolLevelAccess: jsonEncode(
        res.schoolLevelAccess.map((e) => e.toJson()).toList(),
      ),
      createdAt: res.createdAt,
      updatedAt: res.updatedAt,
    );
  }

  /// MANUAL MAPPING: Drift Row -> Response Model
  TeacherResponse _mapToResponse(SchoolAdmin row) {
    // 1. Bongkar JSON String untuk akses jenjang
    final List<dynamic> accessListRaw = jsonDecode(row.schoolLevelAccess);
    final List<SchoolLevelAccess> accessList = accessListRaw
        .map((e) => SchoolLevelAccess.fromJson(e as Map<String, dynamic>))
        .toList();

    // 2. Return object Response
    return TeacherResponse(
      id: row.id,
      schoolId: row.schoolId,
      dob: row.dob,
      birthPlace: row.birthPlace,
      nik: row.nik,
      nip: row.nip,

      // Mapping kembali ke Enum
      employeeType: EmployeeType.values.byName(row.employeeType),
      workStatus: WorkStatus.values.byName(row.workStatus),
      employeeEndStatus: EmployeeEndStatus.values.byName(row.employeeEndStatus),

      hireEnd: row.hireEnd, // DateTime? di row otomatis match

      hireDate: row.hireDate,
      phone: row.phone,

      // Mapping manual UserInfo
      user: UserInfo(
        id: row.userId,
        fullName: row.fullName,
        email: row.email,
        gender: Gender.values.byName(row.gender),
        role: Role.values.byName(row.role),
        imageUrl: row.imageUrl,
        fileUrl: row.fileUrl,
        address: row.address,
      ),
      schoolLevelAccess: accessList,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  /// AMBIL DATA: Mapping balik dari Drift ke TeacherResponse
  /// AMBIL DATA: Mapping balik dari Drift ke TeacherResponse
  Future<List<TeacherResponse>> getAllLocal() async {
    final rows = await _db.select(_db.schoolAdmins).get();

    // Tinggal panggil fungsi mapping yang sudah dibuat
    return rows.map(_mapToResponse).toList();
  }

  Future<TeacherResponse?> getById(String id) async {
    final query = _db.select(_db.schoolAdmins)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  Future<void> clearAllTeacherLocal() async {
    await _db.delete(_db.schoolAdmins).go();
  }
}
