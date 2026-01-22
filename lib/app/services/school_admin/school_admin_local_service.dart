import 'dart:convert';

import '../../core/enum.dart';
import '../db/database.dart'; // Sesuaikan path database.dart
import 'school_admin_model.dart';

class SchoolAdminLocalService {
  final AppDatabase _db;
  SchoolAdminLocalService(this._db);

  /// BULK INSERT: Langsung tumpah ke database
  /// BULK INSERT: Clear dulu baru isi, dibungkus Transaction agar aman
  Future<void> bulkInsert(List<SchoolAdminResponse> admins) async {
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
  SchoolAdminsCompanion _mapToCompanion(SchoolAdminResponse res) {
    return SchoolAdminsCompanion.insert(
      id: res.id,
      schoolId: res.schoolId,
      dob: res.dob,
      birthPlace: res.birthPlace,
      nik: res.nik,
      status: res.status.name,
      userId: res.user.id,
      fullName: res.user.fullName,
      email: res.user.email,
      gender: res.user.gender.name,
      imageUrl: res.user.imageUrl,
      // Mapping manual List ke JSON String
      schoolLevelAccess: jsonEncode(
        res.schoolLevelAccess.map((e) => e.toJson()).toList(),
      ),
      createdAt: res.createdAt,
      updatedAt: res.updatedAt,
    );
  }

  /// AMBIL DATA: Untuk ditampilkan ke UI nanti
  /// AMBIL DATA: Mapping balik dari Drift ke SchoolAdminResponse
  Future<List<SchoolAdminResponse>> getAllLocal() async {
    final List<SchoolAdmin> rows = await _db.select(_db.schoolAdmins).get();

    return rows.map((row) {
      // Bongkar JSON String kembali ke List object
      final List<dynamic> accessListRaw = jsonDecode(row.schoolLevelAccess);
      final List<SchoolLevelAccess> accessList = accessListRaw
          .map((e) => SchoolLevelAccess.fromJson(e))
          .toList();

      // Mapping manual ke SchoolAdminResponse
      return SchoolAdminResponse(
        id: row.id,
        schoolId: row.schoolId,
        dob: row.dob,
        birthPlace: row.birthPlace,
        nik: row.nik,
        status: EmployeeStatus.values.byName(row.status),
        user: UserInfo(
          id: row.userId,
          fullName: row.fullName,
          email: row.email,
          gender: Gender.values.byName(row.gender),
          imageUrl: row.imageUrl,
        ),
        schoolLevelAccess: accessList,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
      );
    }).toList();
  }

  Future<void> clearAllAdminLocal() async {
    // Hanya menghapus isi tabel school_admins
    await _db.delete(_db.schoolAdmins).go();
  }
}
