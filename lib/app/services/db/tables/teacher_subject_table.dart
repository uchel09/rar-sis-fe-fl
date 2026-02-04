import 'package:drift/drift.dart';

class TeacherSubjects extends Table {
  TextColumn get id => text()();
  TextColumn get teacherId => text()();
  TextColumn get teacherName => text()();
  TextColumn get subjectId => text()();
  TextColumn get subjectName => text()();
  TextColumn get subjectSubName => text()();
  TextColumn get parentId => text().nullable()();

  // ✅ Simpan seluruh array children sebagai JSON String
  TextColumn get childrenRaw => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
