// lib/app/modules/profile/views/profile_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/profile_controller.dart';
import '../../../../app/core/responsive_wrapper.dart'; // Sesuaikan path wrapper kamu
import '../../../core/drive_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: ResponsiveWrapper(
          mobile: (context) => _buildLayout(context, isMobile: true),
          tablet: (context) => _buildLayout(context, isMobile: false),
          desktop: (context) => _buildLayout(context, isMobile: false),
        ),
      ),
    );
  }

  Widget _buildLayout(BuildContext context, {required bool isMobile}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: 32,
      ),
      child: isMobile
          ? Column(
              children: [
                _buildSidebar(context),
                const SizedBox(height: 24),
                _buildMainContent(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 320, child: _buildSidebar(context)),
                const SizedBox(width: 32),
                Expanded(child: _buildMainContent(context)),
              ],
            ),
    );
  }

  // --- SIDEBAR (Info User & Status) ---
  Widget _buildSidebar(BuildContext context) {
    // WAJIB OBX: Karena data user dan loading image ada di sini
    return Obx(() {
      final user = controller.userData.value;

      return ShadCard(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                if (controller.isImageLoading.value)
                  const SizedBox(
                    width: 220,
                    height: 220,
                    child: Center(
                      child: SpinKitPouringHourGlass(
                        color: Color.fromARGB(255, 2, 176, 235),
                        size: 160.0,
                      ),
                    ),
                  )
                else
                  CachedNetworkImage(
                    imageUrl: DriveHelper.getImageUrl(user?.imageUrl),
                    imageBuilder: (context, imageProvider) => Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 2,
                        ), // Biar ada garis tepi rapi
                        image: DecorationImage(
                          image: imageProvider, // Kunci caching di sini cok
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const SizedBox(
                      width: 220,
                      height: 220,
                      child: Center(
                        child: const SpinKitDualRing(
                          color: Color.fromARGB(255, 2, 176, 235),
                          size: 160.0,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: const Center(
                        child: Text(
                          'AD',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ShadButton.secondary(
                  width: 32,
                  height: 32,
                  padding: EdgeInsets.zero,
                  onPressed: controller.pickImage,
                  child: const Icon(Icons.camera_alt, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              user?.fullName ?? "-",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              user?.role ?? "Guest",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            _buildSidebarItem(Icons.location_on, "Lokasi", "Indonesia"),
            _buildSidebarItem(Icons.person, "Member sejak", "Jan 2026"),
            const SizedBox(height: 24),
            ShadButton.outline(
              width: double.infinity,
              onPressed: () => _showRoleDetailModal(context),
              child: const Text("Detail Role"),
            ),
          ],
        ),
      );
    });
  }

  // --- MAIN CONTENT (Forms & Settings) ---
  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        // Card Informasi Pribadi
        _buildContentCard(
          title: "Informasi Pribadi",
          child: ShadForm(
            key: controller.profileFormKey,
            child: Column(
              children: [
                ShadInputFormField(
                  label: const Text("Nama Lengkap"),
                  controller: controller.nameController,
                  placeholder: const Text("Nama sesuai identitas"),
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("Email"),
                  controller: controller.emailController,
                  readOnly: true, // Email dikunci biasanya dari backend
                  placeholder: const Text("Email anda"),
                ),
                const SizedBox(height: 24),
                // WAJIB OBX: Buat ganti text tombol jadi loading
                Obx(
                  () => ShadButton(
                    width: double.infinity,
                    onPressed: controller.updateGeneralInfo,
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text("Simpan Perubahan"),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Card Keamanan
        _buildContentCard(
          title: "Keamanan Akun",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ganti kata sandi secara berkala untuk menjaga keamanan akun.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ShadButton.outline(
                onPressed: () => _showPasswordModal(context),
                child: const Text("Ganti Password"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- HELPERS UI ---
  Widget _buildContentCard({required String title, required Widget child}) {
    return ShadCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  // --- MODALS ---
  void _showRoleDetailModal(BuildContext context) {
    // Ambil data terbaru saat dialog dibuka
    final user = controller.userData.value;
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text("User Information"),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSidebarItem(Icons.badge, "Role", user?.role ?? "-"),
            _buildSidebarItem(Icons.numbers, "User ID", user?.id ?? "-"),
          ],
        ),
        actions: [
          ShadButton(child: const Text("Close"), onPressed: () => Get.back()),
        ],
      ),
    );
  }

  void _showPasswordModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text("Update Password"),
        child: SizedBox(
          width: 400,
          child: ShadForm(
            key: controller.passwordFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  label: const Text("Current Password"),
                  controller: controller.currentPasswordController,
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                ShadInputFormField(
                  label: const Text("New Password"),
                  controller: controller.newPasswordController,
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                ShadInputFormField(
                  label: const Text("Confirm New Password"),
                  controller: controller.confirmPasswordController,
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
        actions: [
          ShadButton.ghost(
            child: const Text("Cancel"),
            onPressed: () => Get.back(),
          ),
          // WAJIB OBX di tombol modal kalau mau loading state kelihatan
          Obx(
            //update password disini
            () => ShadButton.destructive(
              onPressed: () {},
              child: controller.isLoading.value
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text("Update"),
            ),
          ),
        ],
      ),
    );
  }
}
