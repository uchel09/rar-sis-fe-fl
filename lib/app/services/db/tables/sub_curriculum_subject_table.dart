import 'package:drift/drift.dart';

class SubCurriculumSubjects extends Table {
  TextColumn get id => text()();

  // Flattened dari object subject
  TextColumn get subjectId => text()();
  TextColumn get subjectName => text()();
  IntColumn get hoursPerWeek => integer()();
  TextColumn get subCurriculumId => text()();

  // Simpan any/object sebagai JSON String
  TextColumn get syllabus => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
