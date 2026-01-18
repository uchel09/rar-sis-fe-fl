import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Ambil dari cache
    final box = GetStorage(); // Langsung panggil di sini
    final bool isLoggedIn = box.read('isLoggedIn') ?? false;
    final String? role = box.read('role');
    // LOGIKA TERBALIK: Kalau udah login tapi iseng ke Login/Home
    if (isLoggedIn && (route == Routes.LOGIN)) {
      return RouteSettings(name: _getRouteByRole(role));
    }

    // LOGIKA PROTEKSI: Kalau belum login tapi mau masuk Dashboard
    if (!isLoggedIn && (route != Routes.LOGIN)) {
      return const RouteSettings(name: Routes.LOGIN);
    }

    return null;
  }

  String _getRouteByRole(String? role) {
    switch (role) {
      case "SCHOOL_ADMIN":
        return Routes.HOME_ADMIN_DASHBOARD;
      case "TEACHER":
        return Routes.HOME_TEACHER_DASHBOARD;
      case "SUPERADMIN":
        return Routes.HOME_SUPAD_DASHBOARD;
      case "STUDENT":
        return Routes.HOME_STUDENT_DASHBOARD;
      case "STAFF":
        return Routes.HOME_STAFF_DASHBOARD;
      // ... sisanya
      default:
        return Routes.LOGIN;
    }
  }
}
