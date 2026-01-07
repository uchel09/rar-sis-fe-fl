import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/login_controller.dart';
import '../../../core/responsive_wrapper.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.lock_rounded, size: 56, color: Colors.indigo),
            const SizedBox(height: 16),

            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            const Text(
              'Masuk ke dashboard sekolah',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 32),

            ShadInput(
              controller: controller.emailController,
              placeholder: const Text('Email'),
            ),

            const SizedBox(height: 16),

            ShadInput(
              controller: controller.passwordController,
              obscureText: true,
              placeholder: const Text('Password'),
            ),

            const SizedBox(height: 24),

            Obx(
              () => SizedBox(
                height: 48,
                child: ShadButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.login,
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
