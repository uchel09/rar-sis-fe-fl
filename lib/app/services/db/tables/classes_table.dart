import 'package:drift/drift.dart';

class Classes extends Table {
  TextColumn get id => text()();
  TextColumn get schoolId => text()();
  TextColumn get schoolLevelId => text()();
  TextColumn get majorId => text().nullable()();
  TextColumn get homeroomTeacherId => text().nullable()();
  TextColumn get homeroomTeacherName => text().nullable()();
  TextColumn get subCurriculumId => text()();
  TextColumn get name => text()();
  IntColumn get capacity => integer()();
  TextColumn get grade => text()(); // Simpan enum Prisma sebagai String
  BoolColumn get isActive => boolean()();
  IntColumn get studentCount => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
