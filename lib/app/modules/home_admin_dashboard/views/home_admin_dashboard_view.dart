import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_admin_dashboard_controller.dart';

class HomeAdminDashboardView extends GetView<HomeAdminDashboardController> {
  const HomeAdminDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeAdminDashboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeAdminDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
