import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/main_dashboard_layout.dart';
import '../../../widgets/dashboard_components.dart';
import '../controllers/home_staff_dashboard_controller.dart';
// Import file routes kamu untuk memanggil nama rute secara aman
import '../../../routes/app_pages.dart';

class HomeStaffDashboardView extends GetView<HomeStaffDashboardController> {
  const HomeStaffDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MainDashboardLayout(
        title: "Staff Panel",
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
                controller.onMenuSelected("1", Routes.HOME_STAFF_OVERVIEW),
          ),
          _buildMenuSection("AKADEMIK"),
          _expansionMenu(
            icon: Icons.school_outlined,
            label: "Manajemen",
            children: [
              _subMenuItem("Siswa", "2-1", Routes.HOME_STAFF_OVERVIEW),
              _subMenuItem("Guru", "2-2", Routes.HOME_STAFF_OVERVIEW),
              _subMenuItem("Kelas", "2-3", Routes.HOME_STAFF_OVERVIEW),
              _subMenuItem("Staff", "2-4", Routes.HOME_STAFF_OVERVIEW),
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
          initialRoute: Routes.HOME_STAFF_OVERVIEW,
          anchorRoute: Routes.HOME_STAFF_DASHBOARD,
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
    return Builder(
      builder: (context) {
        // Cek lebar layar lewat context builder
        final double width = MediaQuery.of(context).size.width;
        final bool forceExpanded = width < 1024
            ? false
            : controller.isCollapsed.value;

        return DashboardComponents.expansionMenu(
          id: label, // Pake label biar unik (Kurikulum, Manajemen User, dll)
          icon: icon,
          label: label,
          isCollapsed: forceExpanded,
          controller: controller,
          children: children,
        );
      },
    );
  }
}
