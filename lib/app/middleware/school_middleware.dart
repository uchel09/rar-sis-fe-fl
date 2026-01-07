import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/controllers/school_controller.dart';

class SchoolMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!Get.isRegistered<SchoolController>()) return null; // amanin
    final school = Get.find<SchoolController>();
    if (!school.hasSchool) {
      return const RouteSettings(name: '/home');
    }
    return null;
  }
}
