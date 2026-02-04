import 'package:drift/drift.dart';

class SubCurriculums extends Table {
  TextColumn get id => text()();
  TextColumn get curriculumId => text()(); // Foreign Key ke tabel Curriculums
  TextColumn get schoolLevelId => text()(); // ID Jenjang Sekolah
  TextColumn get schoolLevelName => text()(); // ID Jenjang Sekolah
  IntColumn get minutesPerJp => integer()();
  // Sesuai aturan: string antara 1 dan 100 karakter
  TextColumn get name => text().withLength(min: 1, max: 100)();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
