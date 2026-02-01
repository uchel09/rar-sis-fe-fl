import '../db/database.dart';
import 'sub_curriculum_model.dart'; // Pastikan path model benar
import 'package:drift/drift.dart';

class SubCurriculumLocalService {
  final AppDatabase _db;
  SubCurriculumLocalService(this._db);

  /// MANUAL MAPPING: Drift Row -> Response Model
  SubCurriculumResponse _mapToResponse(SubCurriculum row) {
    return SubCurriculumResponse(
      id: row.id,
      curriculumId: row.curriculumId,
      schoolLevelId: row.schoolLevelId,
      name: row.name,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  /// BULK INSERT: Sinkronisasi data dari API ke Lokal (Clear & Insert)
  Future<void> bulkInsert(List<SubCurriculumResponse> items) async {
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
              schoolLevelId: item.schoolLevelId,
              name: item.name,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
          );
        }
      });
    });
  }

  /// AMBIL DATA BERDASARKAN ID
  Future<SubCurriculumResponse?> getById(String id) async {
    final query = _db.select(_db.subCurriculums)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  /// AMBIL SEMUA DATA LOKAL
  Future<List<SubCurriculumResponse>> getAllLocal() async {
    final rows = await _db.select(_db.subCurriculums).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  /// HAPUS SEMUA DATA LOKAL
  Future<void> deleteLocal() async {
    await _db.delete(_db.subCurriculums).go();
  }
}
