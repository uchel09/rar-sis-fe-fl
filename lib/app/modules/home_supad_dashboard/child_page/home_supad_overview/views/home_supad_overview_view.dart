import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_supad_overview_controller.dart';

class HomeSupadOverviewView extends GetView<HomeSupadOverviewController> {
  const HomeSupadOverviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeSupadOverviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeSupadOverviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
