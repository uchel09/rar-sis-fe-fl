import 'package:drift/drift.dart';

class SchoolLevels extends Table {
  TextColumn get id => text()();
  TextColumn get schoolId => text()();
  TextColumn get name => text()();
  BoolColumn get isActive => boolean()();
  BoolColumn get isMajor => boolean()();
  BoolColumn get isEnrollmentNumber => boolean()();
  IntColumn get totalLevel => integer()();

  // Menggunakan textEnum agar tersimpan sebagai String di SQLite (sinkron dengan Prisma)
  TextColumn get identity => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
