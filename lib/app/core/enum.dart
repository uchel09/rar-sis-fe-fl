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
enum EmployeeStatus { ACTIVE, INACTIVE, RESIGNED, ON_LEAVE, PENSION }

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
