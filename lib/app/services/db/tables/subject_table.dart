import 'package:drift/drift.dart';

class Subjects extends Table {
  // Field utama
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get subName => text()();
  TextColumn get schoolId => text()();

  // Menyimpan list object schoolLevelAccess sebagai JSON String (manual mapping)
  // Contoh isi: '[{"id": "...", "name": "..."}]'
  TextColumn get schoolLevelAccess => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
