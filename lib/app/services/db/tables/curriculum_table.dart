import 'package:drift/drift.dart';

class Curriculums extends Table {
  TextColumn get id => text()();
  TextColumn get schoolId => text()();
  TextColumn get name => text()();
  BoolColumn get isActive => boolean()(); // Murni bool, ikut API
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
