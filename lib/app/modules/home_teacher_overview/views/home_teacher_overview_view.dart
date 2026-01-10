import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_teacher_overview_controller.dart';

class HomeTeacherOverviewView extends GetView<HomeTeacherOverviewController> {
  const HomeTeacherOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeTeacherOverviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeTeacherOverviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
