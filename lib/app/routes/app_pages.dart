import 'package:get/get.dart';

import '../middleware/school_middleware.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_admin_dashboard/bindings/home_admin_dashboard_binding.dart';
import '../modules/home_admin_dashboard/views/home_admin_dashboard_view.dart';
import '../modules/home_student_dashboard/bindings/home_student_dashboard_binding.dart';
import '../modules/home_student_dashboard/views/home_student_dashboard_view.dart';
import '../modules/home_teacher_dashboard/bindings/home_teacher_dashboard_binding.dart';
import '../modules/home_teacher_dashboard/views/home_teacher_dashboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

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
      page: () => const HomeTeacherDashboardView(),
      binding: HomeTeacherDashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME_STUDENT_DASHBOARD,
      page: () => const HomeStudentDashboardView(),
      binding: HomeStudentDashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN_DASHBOARD,
      page: () => HomeAdminDashboardView(),
      binding: HomeAdminDashboardBinding(),
    ),
  ];
}
