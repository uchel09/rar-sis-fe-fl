import 'package:rar_sis_fe_fl/app/core/enum.dart';

import '../db/database.dart';
import 'school_level_model.dart';

class SchoolLevelLocalService {
  final AppDatabase _db;
  SchoolLevelLocalService(this._db);

  // --- MAPPING BALIK (Row -> Response) ---
  SchoolLevelResponse _mapToResponse(SchoolLevel row) {
    return SchoolLevelResponse(
      id: row.id,
      schoolId: row.schoolId,
      name: row.name,
      identity: SchoolLevelIdentity.values.byName(row.identity),
      totalLevel: row.totalLevel,
      isActive: row.isActive,
      isMajor: row.isMajor,
      isEnrollmentNumber: row.isEnrollmentNumber,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  // --- CREATE / UPSERT FROM API ---
  Future<void> bulkInsert(List<SchoolLevelResponse> levels) async {
    await _db.transaction(() async {
      await _db.delete(_db.schoolLevels).go();
      await _db.batch((batch) {
        for (final level in levels) {
          batch.insert(
            _db.schoolLevels,
            SchoolLevelsCompanion.insert(
              id: level.id,
              schoolId: level.schoolId,
              name: level.name,
              identity: level.identity.name,
              totalLevel: level.totalLevel,
              isActive: level.isActive,
              isMajor: level.isMajor,
              isEnrollmentNumber: level.isEnrollmentNumber,
              createdAt: level.createdAt,
              updatedAt: level.updatedAt,
            ),
          );
        }
      });
    });
  }

  // --- GET ALL ---
  Future<List<SchoolLevelResponse>> getAllLocal() async {
    final List<SchoolLevel> rows = await _db.select(_db.schoolLevels).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  // --- GET BY ID ---
  Future<SchoolLevelResponse?> getById(String id) async {
    final query = _db.select(_db.schoolLevels)..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  // --- DELETE ---
  Future<void> deleteLocal() async {
    await _db.delete(_db.schoolLevels).go();
  }
}
