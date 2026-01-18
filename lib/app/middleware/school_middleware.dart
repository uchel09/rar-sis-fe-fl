import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/controllers/school_controller.dart';

class SchoolMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // 1. Pastikan Controller sudah siap
    if (!Get.isRegistered<SchoolController>()) return null;

    final school = Get.find<SchoolController>();

    // KONDISI A: User GAK PUNYA school code, tapi mau ke halaman lain (misal /login atau /dashboard)
    // AKSI: Paksa balik ke /home buat isi kode sekolah dulu
    if (!school.hasSchool && route != '/home') {
      return const RouteSettings(name: '/home');
    }

    // KONDISI B: User SUDAH PUNYA school code, tapi dia mencoba buka /home lagi
    // AKSI: Tendang ke /login (sesuai maumu)
    if (school.hasSchool && route == '/home') {
      return const RouteSettings(name: '/login');
    }

    // Selain itu, biarkan lewat
    return null;
  }
}
