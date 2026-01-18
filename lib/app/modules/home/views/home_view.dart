import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../core/responsive_wrapper.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Buka Modal Create Admin (Mapping Manual 11 field)
          Get.toNamed('/login');
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color(0xFFF5F7FA),
      body: Center(
        child: ResponsiveWrapper(
          desktop: (context) => SizedBox(width: 420, child: _card()),
          tablet: (context) => SizedBox(width: 380, child: _card()),
          mobile: (context) =>
              Padding(padding: const EdgeInsets.all(16), child: _card()),
        ),
      ),
    );
  }

  Widget _card() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.school_rounded, size: 64, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'RAR School\nManagement System',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Masukkan kode sekolah untuk melanjutkan',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controller.schoolController,
              decoration: InputDecoration(
                labelText: 'School Code',
                hintText: 'contoh: rarschool',
                prefixIcon: const Icon(Icons.domain),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.submitSchool,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
