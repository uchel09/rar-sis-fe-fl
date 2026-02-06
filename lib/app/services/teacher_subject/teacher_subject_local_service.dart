import '../db/database.dart';
import 'teacher_subject_model.dart';
import 'package:drift/drift.dart';
import 'dart:convert';

class TeacherSubjectLocalService {
  final AppDatabase _db;
  TeacherSubjectLocalService(this._db);

  TeacherSubjectResponse _mapToResponse(TeacherSubject row) {
    // Decode string JSON kembali menjadi List
    final List<dynamic> decodedChildren = jsonDecode(row.childrenRaw);

    return TeacherSubjectResponse(
      id: row.id,
      teacherId: row.teacherId,
      teacherName: row.teacherName, // Ambil dari kolom drift
      subjectId: row.subjectId,
      subjectName: row.subjectName, // Ambil dari kolom drift
      subjectSubName: row.subjectSubName, // Ambil dari kolom drift
      subjectIsParent: row.subjectIsParent, // Ambil dari kolom drift
      schoolLevelId: row.schoolLevelId, // Ambil dari kolom drift
      parentId: row.parentId,
      // Konversi hasil decode menjadi List<TeacherSubjectResponse>
      children: decodedChildren
          .map((childJson) => TeacherSubjectResponse.fromJson(childJson))
          .toList(),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  Future<void> bulkInsert(List<TeacherSubjectResponse> items) async {
    await _db.transaction(() async {
      // 1. Hapus data lama agar sinkron total dengan backend
      await _db.delete(_db.teacherSubjects).go();

      // 2. Gunakan batch untuk performa insert massal
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.teacherSubjects,
            TeacherSubjectsCompanion.insert(
              id: item.id,
              teacherId: item.teacherId,
              teacherName: item.teacherName, // Kolom baru dari mapping manual
              subjectId: item.subjectId,
              subjectName: item.subjectName, // Kolom baru dari mapping manual
              subjectSubName:
                  item.subjectSubName, // Kolom baru dari mapping manual
              subjectIsParent:
                  item.subjectIsParent, // Kolom baru dari mapping manual
              schoolLevelId:
                  item.schoolLevelId, // Kolom baru dari mapping manual
              parentId: Value(
                item.parentId,
              ), // Bisa null sesuai update terakhir
              // ✅ Simpan list children rekursif sebagai JSON String
              childrenRaw: jsonEncode(
                item.children.map((e) => e.toJson()).toList(),
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

  Future<void> bulkInsertBySchoolLevelId(
    List<TeacherSubjectResponse> items,
  ) async {
    await _db.transaction(() async {
      // 1. Hapus data lama agar sinkron total dengan backend
      // Hapus hanya data untuk level yang sedang di-sync
      await (_db.delete(
        _db.teacherSubjects,
      )..where((t) => t.schoolLevelId.equals(items.first.schoolLevelId))).go();

      // 2. Gunakan batch untuk performa insert massal
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.teacherSubjects,
            TeacherSubjectsCompanion.insert(
              id: item.id,
              teacherId: item.teacherId,
              teacherName: item.teacherName, // Kolom baru dari mapping manual
              subjectId: item.subjectId,
              subjectName: item.subjectName, // Kolom baru dari mapping manual
              subjectSubName:
                  item.subjectSubName, // Kolom baru dari mapping manual
              subjectIsParent:
                  item.subjectIsParent, // Kolom baru dari mapping manual
              schoolLevelId:
                  item.schoolLevelId, // Kolom baru dari mapping manual
              parentId: Value(
                item.parentId,
              ), // Bisa null sesuai update terakhir
              // ✅ Simpan list children rekursif sebagai JSON String
              childrenRaw: jsonEncode(
                item.children.map((e) => e.toJson()).toList(),
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

  Future<void> bulkInsertByTeacherId(List<TeacherSubjectResponse> items) async {
    await _db.transaction(() async {
      // 1. Hapus data lama agar sinkron total dengan backend
      // Hapus hanya data untuk level yang sedang di-sync
      await (_db.delete(
        _db.teacherSubjects,
      )..where((t) => t.teacherId.equals(items.first.teacherId))).go();

      // 2. Gunakan batch untuk performa insert massal
      await _db.batch((batch) {
        for (final item in items) {
          batch.insert(
            _db.teacherSubjects,
            TeacherSubjectsCompanion.insert(
              id: item.id,
              teacherId: item.teacherId,
              teacherName: item.teacherName, // Kolom baru dari mapping manual
              subjectId: item.subjectId,
              subjectName: item.subjectName, // Kolom baru dari mapping manual
              subjectSubName:
                  item.subjectSubName, // Kolom baru dari mapping manual
              subjectIsParent:
                  item.subjectIsParent, // Kolom baru dari mapping manual
              schoolLevelId:
                  item.schoolLevelId, // Kolom baru dari mapping manual
              parentId: Value(
                item.parentId,
              ), // Bisa null sesuai update terakhir
              // ✅ Simpan list children rekursif sebagai JSON String
              childrenRaw: jsonEncode(
                item.children.map((e) => e.toJson()).toList(),
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

  Future<TeacherSubjectResponse?> getByIdLocal(String id) async {
    final query = _db.select(_db.teacherSubjects)
      ..where((t) => t.id.equals(id));
    final row = await query.getSingleOrNull();
    return row != null ? _mapToResponse(row) : null;
  }

  Future<List<TeacherSubjectResponse>> getAllLocal() async {
    final rows = await _db.select(_db.teacherSubjects).get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  Future<List<TeacherSubjectResponse>> getAllSubjectNameIsParentLocal(
    String name,
    bool isParent,
  ) async {
    // Query langsung ke tabel teacherSubjects
    final query = _db.select(_db.teacherSubjects)
      ..where((t) => t.subjectName.equals(name)) // Cari yang namanya sama
      ..where(
        (t) => t.subjectIsParent.equals(isParent),
      ); // Cari yang isParent (true)

    final rows = await query.get();

    // Mapping ke Response
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  Future<List<TeacherSubjectResponse>> getBySchoolLevelLocal(
    String schoolLevelId,
  ) async {
    final query = _db.select(_db.teacherSubjects)
      ..where((t) => t.schoolLevelId.equals(schoolLevelId));

    final rows = await query.get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }

  Future<List<TeacherSubjectResponse>> getByTeacherIdLocal(
    String teacherId,
  ) async {
    final query = _db.select(_db.teacherSubjects)
      ..where((t) => t.teacherId.equals(teacherId));

    final rows = await query.get();
    return rows.map((row) => _mapToResponse(row)).toList();
  }
}
