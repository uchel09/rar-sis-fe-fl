import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/staff/staff_service.dart';
import 'package:rar_sis_fe_fl/app/services/staff_position/staff_position_service.dart';
import 'package:rar_sis_fe_fl/app/services/student-draft/student_draft_service.dart';
import 'package:rar_sis_fe_fl/app/services/sub_curriculum/sub_curriculum_service.dart';
import 'package:rar_sis_fe_fl/app/services/subject/subject_service.dart';
import '../../modules/profile/controllers/profile_controller.dart';
import 'package:rar_sis_fe_fl/app/services/school_admin/school_admin_service.dart';
import 'package:rar_sis_fe_fl/app/services/curriculum/curriculum_service.dart';
import 'package:rar_sis_fe_fl/app/services/teacher/teacher_service.dart';
import 'package:rar_sis_fe_fl/app/services/school_level/school_level_service.dart';
import "master_controller.dart";

// Base-nya lu buat sekali aja di folder core/base
abstract class BaseDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController()); // Standar profil buat semua dashboard
    Get.lazyPut<SchoolAdminService>(() => SchoolAdminService());
    Get.lazyPut<SchoolLevelService>(() => SchoolLevelService());
    Get.lazyPut<CurriculumService>(() => CurriculumService());
    Get.lazyPut<SubjectService>(() => SubjectService());
    Get.lazyPut<SubCurriculumService>(() => SubCurriculumService());
    Get.lazyPut<StudentDraftService>(() => StudentDraftService());
    Get.lazyPut<TeacherService>(() => TeacherService());
    Get.lazyPut<StaffPositionService>(() => StaffPositionService());
    Get.lazyPut<StaffService>(() => StaffService());
    Get.put(MasterController());
    injectController(); // Panggil method abstrak
  }

  void injectController();
}

// Terus di modul Admin lu (Ubah extend Bindings jadi BaseDashboardBinding)
