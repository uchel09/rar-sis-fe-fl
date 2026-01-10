import 'package:get/get.dart';

import '../middleware/school_middleware.dart';
import '../modules/class/bindings/class_binding.dart';
import '../modules/class/views/class_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_admin_dashboard/bindings/home_admin_dashboard_binding.dart';
import '../modules/home_admin_dashboard/views/home_admin_dashboard_view.dart';
import '../modules/home_admin_overview/bindings/home_admin_overview_binding.dart';
import '../modules/home_admin_overview/views/home_admin_overview_view.dart';
import '../modules/home_student_dashboard/bindings/home_student_dashboard_binding.dart';
import '../modules/home_student_dashboard/views/home_student_dashboard_view.dart';
import '../modules/home_student_overview/bindings/home_student_overview_binding.dart';
import '../modules/home_student_overview/views/home_student_overview_view.dart';
import '../modules/home_teacher_dashboard/bindings/home_teacher_dashboard_binding.dart';
import '../modules/home_teacher_dashboard/views/home_teacher_dashboard_view.dart';
import '../modules/home_teacher_overview/bindings/home_teacher_overview_binding.dart';
import '../modules/home_teacher_overview/views/home_teacher_overview_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/student/bindings/student_binding.dart';
import '../modules/student/views/student_view.dart';
import '../modules/teacher/bindings/teacher_binding.dart';
import '../modules/teacher/views/teacher_view.dart';

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
    ),
    GetPage(
      name: _Paths.HOME_TEACHER_DASHBOARD,
      page: () => HomeTeacherDashboardView(),
      binding: HomeTeacherDashboardBinding(),
      children: [
        GetPage(
          name: _Paths.HOME_TEACHER_OVERVIEW,
          page: () => const HomeTeacherOverviewView(),
          binding: HomeTeacherOverviewBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.HOME_STUDENT_DASHBOARD,
      page: () => HomeStudentDashboardView(),
      binding: HomeStudentDashboardBinding(),
      children: [
        GetPage(
          name: _Paths.HOME_STUDENT_OVERVIEW,
          page: () => const HomeStudentOverviewView(),
          binding: HomeStudentOverviewBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.HOME_ADMIN_DASHBOARD,
      page: () => HomeAdminDashboardView(),
      binding: HomeAdminDashboardBinding(),
      children: [
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
          name: _Paths.HOME_ADMIN_OVERVIEW,
          page: () => const HomeAdminOverviewView(),
          binding: HomeAdminOverviewBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.HOME_STUDENT_OVERVIEW,
      page: () => const HomeStudentOverviewView(),
      binding: HomeStudentOverviewBinding(),
    ),
    GetPage(
      name: _Paths.HOME_TEACHER_OVERVIEW,
      page: () => const HomeTeacherOverviewView(),
      binding: HomeTeacherOverviewBinding(),
    ),
  ];
}
