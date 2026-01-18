import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_staff_overview_controller.dart';

class HomeStaffOverviewView extends GetView<HomeStaffOverviewController> {
  const HomeStaffOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeStaffOverviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeStaffOverviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
