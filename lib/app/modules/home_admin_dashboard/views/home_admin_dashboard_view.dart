import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/main_dashboard_layout.dart';
import '../../../widgets/dashboard_components.dart';
import '../controllers/home_admin_dashboard_controller.dart';
// Import file routes kamu untuk memanggil nama rute secara aman
import '../../../routes/app_pages.dart';

class HomeAdminDashboardView extends GetView<HomeAdminDashboardController> {
  const HomeAdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MainDashboardLayout(
        title: "Admin Panel",
        controller: controller,
        menuItems: [
          _buildMenuSection("UTAMA"),
          DashboardComponents.menuItem(
            icon: Icons.dashboard_outlined,
            label: "Dashboard",
            id: "1",
            isCollapsed: controller.isCollapsed.value,
            controller: controller,
            // Sesuaikan dengan nama rute di AppPages
            onTap: () =>
                controller.onMenuSelected("1", Routes.HOME_ADMIN_OVERVIEW),
          ),
          _buildMenuSection("AKADEMIK"),
          _expansionMenu(
            icon: Icons.school_outlined,
            label: "Manajemen User",
            children: [
              _subMenuItem("Siswa", "2-1", Routes.STUDENT),
              _subMenuItem("Guru", "2-2", Routes.TEACHER),
              _subMenuItem("Kelas", "2-3", Routes.CLASS),
              _subMenuItem("Staff", "2-4", Routes.STAFF),
              _subMenuItem("Posisi Staff", "2-5", Routes.STAFF_POSITION),
            ],
          ),
          _expansionMenu(
            icon: Icons.school_outlined,
            label: "Kurikulum",
            children: [
              _subMenuItem("Sub Kurikulum", "3-1", Routes.SUB_CURRICULUM),
              _subMenuItem("Guru/Mapel", "3-2", Routes.TEACHER_SUBJECT),
              _subMenuItem("Mapel", "3-3", Routes.SUBJECT),
            ],
          ),
          _expansionMenu(
            icon: Icons.app_registration,
            label: "PPDB",
            children: [
              _subMenuItem("Registrasi", "4-1", Routes.ADMIN_PPDB_REGISTRATION),
              _subMenuItem("Seleksi", "4-2", Routes.ADMIN_PPDB_SELECTION),
              _subMenuItem("Pembayaran", "4-4", Routes.CLASS),
              _subMenuItem("Penentuan Kelas", "4-4", Routes.STAFF),
              _subMenuItem("Riwayat", "4-5", Routes.STAFF),
            ],
          ),
          // _buildMenuSection("KEUANGAN"),
          // DashboardComponents.menuItem(
          //   icon: Icons.payments_outlined,
          //   label: "Tagihan SPP",
          //   id: "3",
          //   isCollapsed: controller.isCollapsed.value,
          //   controller: controller,
          //   onTap: () => controller.onMenuSelected("3", '/admin/billing'),
          // ),
          // DashboardComponents.menuItem(
          //   icon: Icons.settings_outlined,
          //   label: "Pengaturan",
          //   id: "4",
          //   isCollapsed: controller.isCollapsed.value,
          //   controller: controller,
          //   onTap: () => controller.onMenuSelected("4", '/admin/settings'),
          // ),
        ],
        // --- PERBAIKAN DI SINI ---
        // body sekarang merender halaman anak secara dinamis
        body: GetRouterOutlet(
          initialRoute: Routes.HOME_ADMIN_OVERVIEW,
          anchorRoute: Routes.HOME_ADMIN_DASHBOARD,
        ),
      ),
    );
  }

  // --- HELPER LOCAL WIDGETS ---

  Widget _buildMenuSection(String title) {
    return !controller.isCollapsed.value
        ? Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          )
        : const Divider(height: 30, indent: 20, endIndent: 20);
  }

  Widget _subMenuItem(String label, String id, String route) {
    return DashboardComponents.subMenuItem(
      label: label,
      id: id,
      controller: controller,
      onTap: () => controller.onMenuSelected(id, route),
    );
  }

  Widget _expansionMenu({
    required IconData icon,
    required String label,
    required List<Widget> children,
  }) {
    return DashboardComponents.expansionMenu(
      id: "akademik_menu",
      icon: icon,
      label: label,
      isCollapsed: controller.isCollapsed.value,
      controller: controller,
      children: children,
    );
  }
}
