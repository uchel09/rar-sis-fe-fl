import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_student_overview_controller.dart';

class HomeStudentOverviewView extends GetView<HomeStudentOverviewController> {
  const HomeStudentOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeStudentOverviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeStudentOverviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
