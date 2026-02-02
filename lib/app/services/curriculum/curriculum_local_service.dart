import '../db/database.dart';
import 'curriculum_model.dart';

class CurriculumLocalService {
  final AppDatabase _db;
  CurriculumLocalService(this._db);

  CurriculumResponse _mapToResponse(Curriculum row) {
    return CurriculumResponse(
      id: row.id,
      schoolId: row.schoolId,
      name: row.name,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  Future<void> bulkInsert(List<CurriculumResponse> items) async {
    await _db.transaction(() async {
      await _db.delete(_db.curriculums).go();
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.curriculums,
            CurriculumsCompanion.insert(
              id: item.id,
              schoolId: item.schoolId,
              name: item.name,
              isActive: item.isActive,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
          );
        }
      });
    });
  }

  Future<CurriculumResponse?> getById(String id) async {
    final query = _db.select(_db.curriculums)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  Future<List<CurriculumResponse>> getAllLocal() async {
    final rows = await _db.select(_db.curriculums).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  Future<List<CurriculumResponse>> getAllLocalByActive(bool active) async {
    // Tambahkan .where untuk filter isActive
    final rows = await (_db.select(
      _db.curriculums,
    )..where((t) => t.isActive.equals(active))).get();

    return rows.map((row) => _mapToResponse(row)).toList();
  }

  Future<void> deleteLocal() async {
    await _db.delete(_db.curriculums).go();
  }
}
