import 'package:drift/drift.dart';

class SchoolAdmins extends Table {
  // Field utama dari SchoolAdminResponse
  TextColumn get id => text()();
  TextColumn get schoolId => text()();
  DateTimeColumn get dob => dateTime()();
  TextColumn get birthPlace => text()();
  TextColumn get nik => text()();
  TextColumn get nip => text().nullable().unique()();

  DateTimeColumn get hireDate => dateTime()();
  TextColumn get employeeType =>
      text()(); // Ganti isHonor dengan ini (Enum String)
  TextColumn get workStatus => text()(); // PENTING: Untuk status kehadiran
  TextColumn get employeeEndStatus => text()(); // Nullable untuk pensiun/resign
  DateTimeColumn get hireEnd => dateTime().nullable()();
  TextColumn get phone => text()();

  // Field hasil bongkar object 'user' (UserInfo)
  TextColumn get userId => text()();
  TextColumn get fullName => text()();
  TextColumn get email => text()();
  TextColumn get gender => text()(); // Simpan string dari enum Gender
  TextColumn get role => text()(); // Simpan string dari enum Role
  TextColumn get imageUrl => text()();
  TextColumn get fileUrl => text()();
  TextColumn get address => text()();

  // Field tambahan
  TextColumn get schoolLevelAccess => text()(); // Simpan sebagai JSON String
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
