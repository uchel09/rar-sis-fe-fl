import 'dart:convert';
import '../db/database.dart';
import 'sub_curriculum_subject_model.dart';
import 'package:drift/drift.dart';

class SubCurriculumSubjectLocalService {
  final AppDatabase _db;
  SubCurriculumSubjectLocalService(this._db);

  SubCurriculumSubjectResponse _mapToResponse(SubCurriculumSubject row) {
    return SubCurriculumSubjectResponse(
      id: row.id,
      subjectId: row.subjectId,
      subjectName: row.subjectName,
      subCurriculumId: row.subCurriculumId,
      hoursPerWeek: row.hoursPerWeek,
      syllabus: row.syllabus != null ? jsonDecode(row.syllabus!) : null,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  Future<void> bulkInsert(List<SubCurriculumSubjectResponse> items) async {
    await _db.transaction(() async {
      await _db.delete(_db.subCurriculumSubjects).go();
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.subCurriculumSubjects,
            SubCurriculumSubjectsCompanion.insert(
              id: item.id,
              subjectId: item.subjectId,
              subjectName: item.subjectName,
              subCurriculumId: item.subCurriculumId,
              hoursPerWeek: item.hoursPerWeek,
              syllabus: Value(
                item.syllabus != null ? jsonEncode(item.syllabus) : null,
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

  Future<List<SubCurriculumSubjectResponse>> getAllLocal() async {
    final rows = await _db.select(_db.subCurriculumSubjects).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }
}
