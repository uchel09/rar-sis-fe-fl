part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  // Student Dashboard
  static const HOME_STUDENT_DASHBOARD = _Paths.HOME_STUDENT_DASHBOARD;
  static const HOME_STUDENT_OVERVIEW =
      _Paths.HOME_STUDENT_DASHBOARD + _Paths.HOME_STUDENT_OVERVIEW;
  // Teacher Dashboard
  static const HOME_TEACHER_DASHBOARD = _Paths.HOME_TEACHER_DASHBOARD;
  static const HOME_TEACHER_OVERVIEW =
      _Paths.HOME_TEACHER_DASHBOARD + _Paths.HOME_TEACHER_OVERVIEW;
  // Admin Dashboard
  static const HOME_ADMIN_DASHBOARD = _Paths.HOME_ADMIN_DASHBOARD;
  static const HOME_ADMIN_OVERVIEW =
      _Paths.HOME_ADMIN_DASHBOARD + _Paths.HOME_ADMIN_OVERVIEW;
  static const TEACHER = _Paths.HOME_ADMIN_DASHBOARD + _Paths.TEACHER;
  static const STUDENT = _Paths.HOME_ADMIN_DASHBOARD + _Paths.STUDENT;
  static const CLASS = _Paths.HOME_ADMIN_DASHBOARD + _Paths.CLASS;
  static const STAFF = _Paths.HOME_ADMIN_DASHBOARD + _Paths.STAFF;
  // Staff Dashboard
  static const HOME_STAFF_DASHBOARD = _Paths.HOME_STAFF_DASHBOARD;
  static const HOME_STAFF_OVERVIEW =
      _Paths.HOME_STAFF_DASHBOARD + _Paths.HOME_STAFF_OVERVIEW;
  // Super Admin Dashboard
  static const HOME_SUPAD_DASHBOARD = _Paths.HOME_SUPAD_DASHBOARD;
  static const HOME_SUPAD_OVERVIEW =
      _Paths.HOME_SUPAD_DASHBOARD + _Paths.HOME_SUPAD_OVERVIEW;
  static const SUPAD_ADMIN = _Paths.HOME_SUPAD_DASHBOARD + _Paths.SUPAD_ADMIN;
  static const SUPAD_SCHOOL_LEVEL =
      _Paths.HOME_SUPAD_DASHBOARD + _Paths.SUPAD_SCHOOL_LEVEL;
  static const SUPAD_CURRICULUM =
      _Paths.HOME_SUPAD_DASHBOARD + _Paths.SUPAD_CURRICULUM;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  // Teacher Dashboard
  static const HOME_TEACHER_DASHBOARD = '/home-teacher-dashboard';
  static const HOME_TEACHER_OVERVIEW = '/home-teacher-overview';
  // Student Dashboard
  static const HOME_STUDENT_DASHBOARD = '/home-student-dashboard';
  static const HOME_STUDENT_OVERVIEW = '/home-student-overview';
  // Admin Dashboard
  static const HOME_ADMIN_DASHBOARD = '/home-admin-dashboard';
  static const HOME_ADMIN_OVERVIEW = '/home-admin-overview';
  static const STAFF = '/staff';
  static const TEACHER = '/teacher';
  static const STUDENT = '/student';
  static const CLASS = '/class';
  // Staff Dashboard
  static const HOME_STAFF_DASHBOARD = '/home-staff-dashboard';
  static const HOME_STAFF_OVERVIEW = '/home-staff-overview';
  // Super Admin Dashboard
  static const HOME_SUPAD_DASHBOARD = '/home-supad-dashboard';
  static const HOME_SUPAD_OVERVIEW = '/home-supad-overview';
  static const SUPAD_ADMIN = '/supad-admin';
  static const SUPAD_SCHOOL_LEVEL = '/supad-school-level';
  static const SUPAD_CURRICULUM = '/supad-curriculum';
}
