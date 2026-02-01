import '../db/database.dart';
import 'subject_model.dart';
import 'package:drift/drift.dart';

class SubjectLocalService {
  final AppDatabase _db;
  SubjectLocalService(this._db);

  SubjectResponse _mapToResponse(Subject row) {
    return SubjectResponse(
      id: row.id,
      name: row.name,
      schoolId: row.schoolId,
      schoolLevelId: row.schoolLevelId,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  Future<void> bulkInsert(List<SubjectResponse> items) async {
    await _db.transaction(() async {
      await _db.delete(_db.subjects).go();
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.subjects,
            SubjectsCompanion.insert(
              id: item.id,
              name: item.name,
              schoolId: item.schoolId,
              schoolLevelId: item.schoolLevelId,
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
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
}
