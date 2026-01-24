import 'package:drift/drift.dart';

class SchoolAdmins extends Table {
  // Field utama dari SchoolAdminResponse
  TextColumn get id => text()();
  TextColumn get schoolId => text()();
  DateTimeColumn get dob => dateTime()();
  TextColumn get birthPlace => text()();
  TextColumn get nik => text()();
  TextColumn get nip => text()();
  TextColumn get status =>
      text()(); // Kita simpan string dari enum EmployeeStatus
  DateTimeColumn get hireDate => dateTime()();
  TextColumn get phone => text()();
  BoolColumn get isHonor => boolean()();

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
