import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/login_controller.dart';
import '../../../core/responsive_wrapper.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  // Buat key untuk form agar bisa divalidasi
  static final formKey = GlobalKey<ShadFormState>();

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
        // --- BUNGKUS DENGAN SHADFORM ---
        child: ShadForm(
          key: formKey,
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
              const SizedBox(height: 32),

              // VALIDASI EMAIL
              ShadInputFormField(
                controller: controller.emailController,
                placeholder: const Text('Email'),
                validator: (v) {
                  if (v.isEmpty) return 'Email wajib diisi';
                  if (!GetUtils.isEmail(v)) return 'Format email tidak valid';
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // VALIDASI PASSWORD
              ShadInputFormField(
                controller: controller.passwordController,
                obscureText: true,
                placeholder: const Text('Password'),
                validator: (v) {
                  if (v.isEmpty) return 'Password wajib diisi';
                  if (v.length < 8) return 'Password minimal 8 karakter';
                  return null;
                },
              ),

              const SizedBox(height: 24),

              Obx(
                () => SizedBox(
                  height: 48,
                  child: ShadButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            // CEK VALIDASI SEBELUM LOGIN
                            if (formKey.currentState!.saveAndValidate()) {
                              controller.login();
                            }
                          },
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors
                                  .white, // Sesuaikan dengan warna teks button
                            ),
                          ) // Pake spinner bawaan Shadcn
                        : const Text('Login'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
