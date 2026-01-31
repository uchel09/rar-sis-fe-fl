import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ppdb_selection_controller.dart';

class PpdbSelectionView extends GetView<PpdbSelectionController> {
  const PpdbSelectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PpdbSelectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PpdbSelectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
