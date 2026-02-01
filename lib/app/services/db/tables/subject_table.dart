import 'package:drift/drift.dart';

// Agar tidak bentrok dengan SubjectResponse
class Subjects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get schoolId => text()();
  TextColumn get schoolLevelId => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
