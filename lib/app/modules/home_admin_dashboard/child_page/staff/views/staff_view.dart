import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/staff_controller.dart';

class StaffView extends GetView<StaffController> {
  const StaffView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StaffView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StaffView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
