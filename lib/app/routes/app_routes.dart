part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const HOME_TEACHER_DASHBOARD = _Paths.HOME_TEACHER_DASHBOARD;
  static const HOME_STUDENT_DASHBOARD = _Paths.HOME_STUDENT_DASHBOARD;
  static const HOME_ADMIN_DASHBOARD = _Paths.HOME_ADMIN_DASHBOARD;
  static const TEACHER = _Paths.HOME_ADMIN_DASHBOARD + _Paths.TEACHER;
  static const STUDENT = _Paths.HOME_ADMIN_DASHBOARD + _Paths.STUDENT;
  static const CLASS = _Paths.HOME_ADMIN_DASHBOARD + _Paths.CLASS;
  static const HOME_ADMIN_OVERVIEW =
      _Paths.HOME_ADMIN_DASHBOARD + _Paths.HOME_ADMIN_OVERVIEW;
  static const HOME_STUDENT_OVERVIEW =
      _Paths.HOME_STUDENT_DASHBOARD + _Paths.HOME_STUDENT_OVERVIEW;
  static const HOME_TEACHER_OVERVIEW =
      _Paths.HOME_TEACHER_DASHBOARD + _Paths.HOME_TEACHER_OVERVIEW;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const HOME_TEACHER_DASHBOARD = '/home-teacher-dashboard';
  static const HOME_STUDENT_DASHBOARD = '/home-student-dashboard';
  static const HOME_ADMIN_DASHBOARD = '/home-admin-dashboard';
  static const TEACHER = '/teacher';
  static const STUDENT = '/student';
  static const CLASS = '/class';
  static const HOME_ADMIN_OVERVIEW = '/home-admin-overview';
  static const HOME_STUDENT_OVERVIEW = '/home-student-overview';
  static const HOME_TEACHER_OVERVIEW = '/home-teacher-overview';
}
