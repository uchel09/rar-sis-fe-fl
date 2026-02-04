import '../db/database.dart';
import 'sub_curriculum_model.dart' as model; // Pastikan path model benar
import 'package:drift/drift.dart';
import 'dart:convert';

class SubCurriculumLocalService {
  final AppDatabase _db;
  SubCurriculumLocalService(this._db);

  /// MANUAL MAPPING: Drift Row -> Response Model
  model.SubCurriculumResponse _mapToResponse(SubCurriculum row) {
    return model.SubCurriculumResponse(
      id: row.id,
      curriculumId: row.curriculumId,
      name: row.name,
      minutesPerJp: row.minutesPerJp,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      // Menggunakan konstruktor class SchoolLevel secara manual
      schoolLevel: model.SchoolLevel(
        id: row.schoolLevelId,
        name: row.schoolLevelName, // Gunakan default value jika null
      ),
      subjects: (jsonDecode(row.subjects) as List)
          .map((e) => model.SubCurriculumSubject.fromJson(e))
          .toList(),
    );
  }

  /// BULK INSERT: Sinkronisasi data dari API ke Lokal (Clear & Insert)
  Future<void> bulkInsert(List<model.SubCurriculumResponse> items) async {
    await _db.transaction(() async {
      // 1. Bersihkan tabel lokal
      await _db.delete(_db.subCurriculums).go();

      // 2. Batch insert data baru
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.subCurriculums,
            SubCurriculumsCompanion.insert(
              id: item.id,
              curriculumId: item.curriculumId,
              schoolLevelId: item.schoolLevel.id,
              schoolLevelName: item.schoolLevel.name,
              subjects: jsonEncode(
                item.subjects.map((e) => e.toJson()).toList(),
              ),
              name: item.name,
              minutesPerJp: item.minutesPerJp,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
          );
        }
      });
    });
  }

  Future<void> bulkInsertCurriculum(
    List<model.SubCurriculumResponse> items,
    String curriculumId,
  ) async {
    await _db.transaction(() async {
      // 1. Bersihkan data yang memiliki curriculumId yang sama saja
      await (_db.delete(
        _db.subCurriculums,
      )..where((t) => t.curriculumId.equals(curriculumId))).go();

      // 2. Batch insert data baru
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.subCurriculums,
            SubCurriculumsCompanion.insert(
              id: item.id,
              curriculumId: item.curriculumId,
              schoolLevelId: item.schoolLevel.id,
              schoolLevelName: item.schoolLevel.name,
              name: item.name,
              subjects: jsonEncode(
                item.subjects.map((e) => e.toJson()).toList(),
              ),
              minutesPerJp: item.minutesPerJp,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
          );
        }
      });
    });
  }

  /// AMBIL DATA BERDASARKAN ID
  Future<model.SubCurriculumResponse?> getById(String id) async {
    final query = _db.select(_db.subCurriculums)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  /// AMBIL SEMUA DATA LOKAL
  Future<List<model.SubCurriculumResponse>> getAllLocal() async {
    final rows = await _db.select(_db.subCurriculums).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  Future<List<model.SubCurriculumResponse>> getAllByCurriculumLocal(
    String curriculumId,
  ) async {
    final rows = await (_db.select(
      _db.subCurriculums,
    )..where((t) => t.curriculumId.equals(curriculumId))).get();

    return rows.map((row) => _mapToResponse(row)).toList();
  }

  /// HAPUS SEMUA DATA LOKAL
  Future<void> deleteLocal() async {
    await _db.delete(_db.subCurriculums).go();
  }
}
