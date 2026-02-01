import 'package:drift/drift.dart';

class TeacherSubjectConfigs extends Table {
  TextColumn get id => text()();
  TextColumn get teacherId => text()();
  TextColumn get subCurriculumSubjectId => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
