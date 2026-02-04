import 'package:drift/drift.dart';

class SubCurriculums extends Table {
  TextColumn get id => text()();
  TextColumn get curriculumId => text()(); // Foreign Key ke tabel Curriculums
  TextColumn get schoolLevelId => text()(); // ID Jenjang Sekolah
  TextColumn get schoolLevelName => text()(); // ID Jenjang Sekolah
  TextColumn get subjects => text()();
  IntColumn get minutesPerJp => integer()();
  // Sesuai aturan: string antara 1 dan 100 karakter
  TextColumn get name => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
