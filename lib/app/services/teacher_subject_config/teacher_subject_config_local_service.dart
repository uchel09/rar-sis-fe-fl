import '../db/database.dart';
import 'teacher_subject_config_model.dart';
import 'package:drift/drift.dart';

class TeacherSubjectConfigLocalService {
  final AppDatabase _db;
  TeacherSubjectConfigLocalService(this._db);

  /// Mapping: Drift Row -> Response Model
  TeacherSubjectConfigResponse _mapToResponse(TeacherSubjectConfig row) {
    return TeacherSubjectConfigResponse(
      id: row.id,
      teacherId: row.teacherId,
      subCurriculumSubjectId: row.subCurriculumSubjectId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  /// Bulk Insert (Sync API to Local)
  Future<void> bulkInsert(List<TeacherSubjectConfigResponse> items) async {
    await _db.transaction(() async {
      await _db.delete(_db.teacherSubjectConfigs).go();
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.teacherSubjectConfigs,
            TeacherSubjectConfigsCompanion.insert(
              id: item.id,
              teacherId: item.teacherId,
              subCurriculumSubjectId: item.subCurriculumSubjectId,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
          );
        }
      });
    });
  }

  Future<List<TeacherSubjectConfigResponse>> getAllLocal() async {
    final rows = await _db.select(_db.teacherSubjectConfigs).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  Future<TeacherSubjectConfigResponse?> getById(String id) async {
    final query = _db.select(_db.teacherSubjectConfigs)
      ..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  Future<void> deleteLocal() async {
    await _db.delete(_db.teacherSubjectConfigs).go();
  }
}
