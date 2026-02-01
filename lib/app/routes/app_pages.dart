import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../middleware/school_middleware.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_admin_dashboard/bindings/home_admin_dashboard_binding.dart';
import '../modules/home_admin_dashboard/child_page/class/bindings/class_binding.dart';
import '../modules/home_admin_dashboard/child_page/class/views/class_view.dart';
import '../modules/home_admin_dashboard/child_page/home_admin_overview/bindings/home_admin_overview_binding.dart';
import '../modules/home_admin_dashboard/child_page/home_admin_overview/views/home_admin_overview_view.dart';
import '../modules/home_admin_dashboard/child_page/staff/bindings/staff_binding.dart';
import '../modules/home_admin_dashboard/child_page/staff/views/staff_view.dart';
import '../modules/home_admin_dashboard/child_page/student/bindings/student_binding.dart';
import '../modules/home_admin_dashboard/child_page/student/views/student_view.dart';
import '../modules/home_admin_dashboard/child_page/sub-curriculum/bindings/sub_curriculum_binding.dart';
import '../modules/home_admin_dashboard/child_page/sub-curriculum/views/sub_curriculum_view.dart';
import '../modules/home_admin_dashboard/child_page/subject/bindings/subject_binding.dart';
import '../modules/home_admin_dashboard/child_page/subject/views/subject_view.dart';
import '../modules/home_admin_dashboard/child_page/teacher-subject/bindings/teacher_subject_binding.dart';
import '../modules/home_admin_dashboard/child_page/teacher-subject/views/teacher_subject_view.dart';
import '../modules/home_admin_dashboard/child_page/teacher/bindings/teacher_binding.dart';
import '../modules/home_admin_dashboard/child_page/teacher/views/teacher_view.dart';
import '../modules/home_admin_dashboard/views/home_admin_dashboard_view.dart';
import '../modules/home_staff_dashboard/bindings/home_staff_dashboard_binding.dart';
import '../modules/home_staff_dashboard/child_page/home_staff_overview/bindings/home_staff_overview_binding.dart';
import '../modules/home_staff_dashboard/child_page/home_staff_overview/views/home_staff_overview_view.dart';
import '../modules/home_staff_dashboard/views/home_staff_dashboard_view.dart';
import '../modules/home_student_dashboard/bindings/home_student_dashboard_binding.dart';
import '../modules/home_student_dashboard/child_page/home_student_overview/bindings/home_student_overview_binding.dart';
import '../modules/home_student_dashboard/child_page/home_student_overview/views/home_student_overview_view.dart';
import '../modules/home_student_dashboard/views/home_student_dashboard_view.dart';
import '../modules/home_supad_dashboard/bindings/home_supad_dashboard_binding.dart';
import '../modules/home_supad_dashboard/child_page/home_supad_overview/bindings/home_supad_overview_binding.dart';
import '../modules/home_supad_dashboard/child_page/home_supad_overview/views/home_supad_overview_view.dart';
import '../modules/home_supad_dashboard/child_page/supad_admin/bindings/supad_admin_binding.dart';
import '../modules/home_supad_dashboard/child_page/supad_admin/views/supad_admin_view.dart';
import '../modules/home_supad_dashboard/child_page/supad_curriculum/bindings/supad_curriculum_binding.dart';
import '../modules/home_supad_dashboard/child_page/supad_curriculum/views/supad_curriculum_view.dart';
import '../modules/home_supad_dashboard/child_page/supad_school_level/bindings/supad_school_level_binding.dart';
import '../modules/home_supad_dashboard/child_page/supad_school_level/views/supad_school_level_view.dart';
import '../modules/home_supad_dashboard/views/home_supad_dashboard_view.dart';
import '../modules/home_teacher_dashboard/bindings/home_teacher_dashboard_binding.dart';
import '../modules/home_teacher_dashboard/child_page/home_teacher_overview/bindings/home_teacher_overview_binding.dart';
import '../modules/home_teacher_dashboard/child_page/home_teacher_overview/views/home_teacher_overview_view.dart';
import '../modules/home_teacher_dashboard/views/home_teacher_dashboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/ppdb_registration/bindings/ppdb_registration_binding.dart';
import '../modules/ppdb_registration/views/ppdb_registration_view.dart';
import '../modules/ppdb_selection/bindings/ppdb_selection_binding.dart';
import '../modules/ppdb_selection/views/ppdb_selection_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/home_admin_dashboard/child_page/staff-position/bindings/staff_position_binding.dart';
import '../modules/home_admin_dashboard/child_page/staff-position/views/staff_position_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [SchoolMiddleware()],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      middlewares: [SchoolMiddleware(), AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.HOME_TEACHER_DASHBOARD,
      page: () => HomeTeacherDashboardView(),
      binding: HomeTeacherDashboardBinding(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.HOME_TEACHER_OVERVIEW,
          page: () => const HomeTeacherOverviewView(),
          binding: HomeTeacherOverviewBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.PPDB_REGISTRATION,
          page: () => const PpdbRegistrationView(),
          binding: PpdbRegistrationBinding(),
        ),
        GetPage(
          name: _Paths.PPDB_SELECTION,
          page: () => const PpdbSelectionView(),
          binding: PpdbSelectionBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.HOME_STUDENT_DASHBOARD,
      page: () => HomeStudentDashboardView(),
      binding: HomeStudentDashboardBinding(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.HOME_STUDENT_OVERVIEW,
          page: () => const HomeStudentOverviewView(),
          binding: HomeStudentOverviewBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.HOME_ADMIN_DASHBOARD,
      page: () => HomeAdminDashboardView(),
      binding: HomeAdminDashboardBinding(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.HOME_ADMIN_OVERVIEW,
          page: () => const HomeAdminOverviewView(),
          binding: HomeAdminOverviewBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.TEACHER, // Mengambil 'teacher'
          page: () => const TeacherView(),
          binding: TeacherBinding(),
        ),
        GetPage(
          name: _Paths.STUDENT, // Mengambil 'student'
          page: () => const StudentView(),
          binding: StudentBinding(),
        ),
        GetPage(
          name: _Paths.CLASS, // Mengambil 'class'
          page: () => const ClassView(),
          binding: ClassBinding(),
        ),
        GetPage(
          name: _Paths.STAFF,
          page: () => const StaffView(),
          binding: StaffBinding(),
        ),
        GetPage(
          name: _Paths.SUB_CURRICULUM,
          page: () => const SubCurriculumView(),
          binding: SubCurriculumBinding(),
        ),
        GetPage(
          name: _Paths.SUBJECT,
          page: () => const SubjectView(),
          binding: SubjectBinding(),
        ),
        GetPage(
          name: _Paths.TEACHER_SUBJECT,
          page: () => const TeacherSubjectView(),
          binding: TeacherSubjectBinding(),
        ),
        GetPage(
          name: _Paths.PPDB_REGISTRATION,
          page: () => const PpdbRegistrationView(),
          binding: PpdbRegistrationBinding(),
        ),
        GetPage(
          name: _Paths.PPDB_SELECTION,
          page: () => const PpdbSelectionView(),
          binding: PpdbSelectionBinding(),
        ),
        GetPage(
          name: _Paths.STAFF_POSITION,
          page: () => const StaffPositionView(),
          binding: StaffPositionBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.HOME_STAFF_DASHBOARD,
      page: () => HomeStaffDashboardView(),
      binding: HomeStaffDashboardBinding(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.HOME_STAFF_OVERVIEW,
          page: () => const HomeStaffOverviewView(),
          binding: HomeStaffOverviewBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.PPDB_REGISTRATION,
          page: () => const PpdbRegistrationView(),
          binding: PpdbRegistrationBinding(),
        ),
        GetPage(
          name: _Paths.PPDB_SELECTION,
          page: () => const PpdbSelectionView(),
          binding: PpdbSelectionBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.HOME_SUPAD_DASHBOARD,
      page: () => HomeSupadDashboardView(),
      binding: HomeSupadDashboardBinding(),
      middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.HOME_SUPAD_OVERVIEW,
          page: () => const HomeSupadOverviewView(),
          binding: HomeSupadOverviewBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.SUPAD_ADMIN,
          page: () => const SupadAdminView(),
          binding: SupadAdminBinding(),
        ),
        GetPage(
          name: _Paths.SUPAD_SCHOOL_LEVEL,
          page: () => const SupadSchoolLevelView(),
          binding: SupadSchoolLevelBinding(),
        ),
        GetPage(
          name: _Paths.SUPAD_CURRICULUM,
          page: () => const SupadCurriculumView(),
          binding: SupadCurriculumBinding(),
        ),
      ],
    ),
  ];
}
