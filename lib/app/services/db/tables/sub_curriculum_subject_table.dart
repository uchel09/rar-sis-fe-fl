import 'package:drift/drift.dart';

class SubCurriculumSubjects extends Table {
  TextColumn get id => text()();
  TextColumn get subjectId => text()();
  TextColumn get subCurriculumId => text()();
  TextColumn get grade => text()(); // Disimpan sebagai string (name)
  TextColumn get syllabus =>
      text().nullable()(); // JSON string jika syllabus kompleks
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
