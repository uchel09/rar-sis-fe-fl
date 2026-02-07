import 'package:drift/drift.dart';

class Students extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get email => text()();
  TextColumn get fullName => text()();
  TextColumn get gender => text()();
  TextColumn get role => text()();
  TextColumn get imageUrl => text()();
  TextColumn get fileUrl => text()();
  TextColumn get address => text()();
  TextColumn get majorId => text().nullable()();
  TextColumn get schoolId => text()();
  TextColumn get schoolLevelId => text()();
  TextColumn get classId => text().nullable()();
  TextColumn get enrollmentNumber => text().nullable()();
  DateTimeColumn get dob => dateTime()();
  TextColumn get birthPlace => text()();
  TextColumn get grade => text()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
