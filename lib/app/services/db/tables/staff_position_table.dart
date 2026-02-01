import 'package:drift/drift.dart';

class StaffPositions extends Table {
  TextColumn get id => text()(); // Primary Key dari API
  TextColumn get schoolId => text()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text()();
  BoolColumn get isActive => boolean()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
