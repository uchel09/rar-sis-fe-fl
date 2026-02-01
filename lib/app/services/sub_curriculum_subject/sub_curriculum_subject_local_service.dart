import '../db/database.dart';
import 'sub_curriculum_subject_model.dart';
import 'package:drift/drift.dart';
import '../../core/enum.dart';

class SubCurriculumSubjectLocalService {
  final AppDatabase _db;
  SubCurriculumSubjectLocalService(this._db);

  /// MANUAL MAPPING: Drift Row -> Response Model
  SubCurriculumSubjectResponse _mapToResponse(SubCurriculumSubject row) {
    return SubCurriculumSubjectResponse(
      id: row.id,
      subjectId: row.subjectId,
      subCurriculumId: row.subCurriculumId,
      // Konversi string kembali ke Enum Grade
      grade: Grade.values.byName(row.grade),
      syllabus: row.syllabus,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  /// BULK INSERT: Sinkronisasi data API ke Lokal (Transaction & Batch)
  Future<void> bulkInsert(List<SubCurriculumSubjectResponse> items) async {
    await _db.transaction(() async {
      // 1. Bersihkan tabel lokal
      await _db.delete(_db.subCurriculumSubjects).go();

      // 2. Batch insert data baru
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.subCurriculumSubjects,
            SubCurriculumSubjectsCompanion.insert(
              id: item.id,
              subjectId: item.subjectId,
              subCurriculumId: item.subCurriculumId,
              grade: item.grade.name, // Simpan Enum sebagai String
              syllabus: item.syllabus != null
                  ? Value(item.syllabus.toString())
                  : const Value.absent(),
              createdAt: item.createdAt,
              updatedAt: item.updatedAt,
            ),
          );
        }
      });
    });
  }

  /// AMBIL DATA BERDASARKAN ID
  Future<SubCurriculumSubjectResponse?> getById(String id) async {
    final query = _db.select(_db.subCurriculumSubjects)
      ..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  /// AMBIL SEMUA DATA LOKAL
  Future<List<SubCurriculumSubjectResponse>> getAllLocal() async {
    final rows = await _db.select(_db.subCurriculumSubjects).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  /// HAPUS SEMUA DATA LOKAL
  Future<void> deleteLocal() async {
    await _db.delete(_db.subCurriculumSubjects).go();
  }
}
