import 'dart:convert';
import '../db/database.dart';
import 'subject_model.dart';
import 'package:drift/drift.dart';

class SubjectLocalService {
  final AppDatabase _db;
  SubjectLocalService(this._db);

  // Mapping dari Database Row (Subject) kembali ke SubjectResponse
  SubjectResponse _mapToResponse(Subject row) {
    return SubjectResponse(
      id: row.id,
      name: row.name,
      subName: row.subName,
      schoolId: row.schoolId,
      // Decode JSON string dari database kembali ke List<SchoolLevelAccess>
      schoolLevelAccess: (jsonDecode(row.schoolLevelAccess) as List)
          .map((item) => SchoolLevelAccess.fromJson(item))
          .toList(),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  Future<void> bulkInsert(List<SubjectResponse> items) async {
    await _db.transaction(() async {
      // Membersihkan data lama sebelum insert data baru dari API
      await _db.delete(_db.subjects).go();

      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.subjects,
            SubjectsCompanion.insert(
              id: item.id,
              name: item.name,
              subName: item.subName,
              schoolId: item.schoolId,
              // Encode List Object menjadi JSON String sebelum masuk ke DB
              schoolLevelAccess: jsonEncode(
                item.schoolLevelAccess.map((e) => e.toJson()).toList(),
              ),
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    });
  }

  Future<void> bulkInsertBySchoolLevel(
    List<SubjectResponse> items,
    String schoolLevelId,
  ) async {
    await _db.transaction(() async {
      // 1. Hapus data lama yang kolom JSON-nya mengandung ID level ini
      // Kita pakai % agar mencari di posisi mana pun dalam string JSON
      await (_db.delete(
        _db.subjects,
      )..where((t) => t.schoolLevelAccess.like('%$schoolLevelId%'))).go();

      // 2. Insert data baru
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.subjects,
            SubjectsCompanion.insert(
              id: item.id,
              name: item.name,
              subName: item.subName,
              schoolId: item.schoolId,
              schoolLevelAccess: jsonEncode(
                item.schoolLevelAccess.map((e) => e.toJson()).toList(),
              ),
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    });
  }

  Future<SubjectResponse?> getById(String id) async {
    final query = _db.select(_db.subjects)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  Future<List<SubjectResponse>> getAllLocal() async {
    final rows = await _db.select(_db.subjects).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  Future<List<SubjectResponse>> getAllBySchoolLevelLocal(
    String schoolLevelId,
  ) async {
    final query = _db.select(_db.subjects)
      ..where((t) => t.schoolLevelAccess.like('%$schoolLevelId%'));

    final rows = await query.get();

    // Mapping manual menggunakan method _mapToResponse yang sudah kita buat
    return rows.map((row) => _mapToResponse(row)).toList();
  }
}
