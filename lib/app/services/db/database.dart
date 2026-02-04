import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// 1. Import definisi tabel admin yang sudah dibuat tadi
import 'tables/school_admin_table.dart';
import 'tables/school_level_table.dart';
import 'tables/curriculum_table.dart';
import 'tables/sub_curriculum_table.dart';
import 'tables/subject_table.dart';
import 'tables/sub_curriculum_subject_table.dart';
import 'tables/teacher_subject_table.dart';
import 'tables/teacher_table.dart';
import 'tables/staff_table.dart';
import 'tables/staff_position_table.dart';

// 2. File generated (akan merah/error sebelum jalankan build_runner)
part 'database.g.dart';

@DriftDatabase(
  tables: [
    SchoolAdmins,
    SchoolLevels,
    Teachers,
    Staffs,
    StaffPositions,
    Curriculums,
    SubCurriculums,
    Subjects,
    SubCurriculumSubjects,
    TeacherSubjects,
  ],
) // Tambahkan semua class tabel di sini
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Naikan versi jika nanti ada perubahan struktur tabel (migration)
  @override
  int get schemaVersion => 1;
}

// 3. Fungsi untuk menentukan lokasi file database di memori HP
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Mencari folder dokumen aplikasi (Android/iOS)
    final dbFolder = await getApplicationDocumentsDirectory();
    // Nama file database kita
    final file = File(p.join(dbFolder.path, 'school_management.sqlite'));

    return NativeDatabase(file);
  });
}
// command dijalankan setiap tambah table baru;
// flutter pub run build_runner watch --delete-conflicting-outputs