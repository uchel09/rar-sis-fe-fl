// ignore_for_file: constant_identifier_names

/// Role user dalam sistem
enum Role {
  ROOT_SUPERADMIN,
  SUPERADMIN,
  HEAD_MASTER,
  SCHOOL_ADMIN,
  HELPER_SA,
  STUDENT,
  TEACHER,
  PARENT,
  STAFF,
}

enum SchoolLevelIdentity { KB, TK, SD, SMP, SMA, SMK }

/// Status kehadiran
enum AttendanceStatus { PRESENT, ABSENT, SICK, EXCUSED }

/// Semester akademik
enum Semester { SEMESTER_1, SEMESTER_2 }

/// Status draft untuk mutasi, pendaftaran, atau naik kelas
enum DraftStatus { PENDING, APPROVED_PENDING, APPROVED, REJECTED, DONE }

/// Status akademik siswa
enum StudentStatus { ACTIVE, NONACTIVE, GRADUATED, DROPOUT, TRANSFERRED }

/// Hari untuk jadwal pelajaran
enum DayOfWeek { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY }

/// Jenis kelamin
enum Gender { MALE, FEMALE }

/// Tingkatan kelas
enum Grade { GRADE_1, GRADE_2, GRADE_3, GRADE_4, GRADE_5, GRADE_6 }

/// Status kepegawaian
enum EmployeeType {
  PERMANENT, // Pekerja Tetap
  HONORARY, //Pekerja Honor
  PART_TIME, // Pekerja Part time
  CONTRACT, // Pekerja Kontrak
}

enum WorkStatus {
  WORKING, // Sedang bekerja rutin
  ON_LEAVE, // Masih pegawai, tapi sedang cuti
  ON_PERMISION, // izin
  ON_SICK, //sakit
  ON_ABSENT, // alpa
}

enum StudentPaymentStatus {
  // Belum bayar / Baru daftar
  UNPAID,
  // Sudah upload/bayar, menunggu dicek sore hari
  PENDING_PAID,
  // Sudah cocok antara sistem dan uang fisik
  PAID,
  // uang kuran,g setelah di cek ,
  //kalau pembayaran manual tanyakan yang handle terlebih dahulu
  UNDERPAID,
  // Dana tidak terkirim, konsultasi ke yang verifikasi terlebih dahulu
  PROBLEM,
}

enum EmployeeEndStatus {
  PENSION, // Pensiun
  RESIGNED, // Mengundurkan diri
  TERMINATED, // Diberhentikan
  DECEASED, // Wafat (Tambahan opsional)
  CONTRACT_ENDED,
  NONE,
}

/// Tipe penilaian
enum AssessmentType { ASSIGNMENT, MID_EXAM, FINAL_EXAM, PRACTICAL, OTHER }

/// Mode pemberian nilai
enum GradingMode { AUTO, MANUAL }

/// Tipe soal
enum QuestionType { MULTIPLE_CHOICE }

/// Tipe media
enum MediaType { IMAGE }

/// Status subsidi atau beasiswa
enum SubsidyStatus { PENDING, APPROVED, REJECTED, FINISHED }

/// Tipe potongan (Persen atau Rupiah)
enum DiscountType { PERCENTAGE, FIXED }

/// Status pembayaran
enum PaymentStatus { UNPAID, WAITING_CONFIRMATION, PAID, REJECTED }
