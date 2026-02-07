import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/core/base/master_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../core/responsive_wrapper.dart';
import './circle_cache_avatar.dart';

class MainDashboardLayout extends StatelessWidget {
  final String title;
  final List<Widget> menuItems;
  final Widget body;
  final dynamic controller; // Harus extends BaseDashboardController
  final MasterController masterController = Get.find<MasterController>();
  // Controller untuk ShadPopover
  final popoverController = ShadPopoverController();

  MainDashboardLayout({
    super.key,
    required this.title,
    required this.menuItems,
    required this.body,
    required this.controller,
  });

  // Fungsi Helper Manual untuk Kapitalisasi (Solusi error capitalizeFirst)
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      mobile: (context) => _buildLayout(context, isMobile: true),
      tablet: (context) => _buildLayout(context, isMobile: true),
      desktop: (context) => _buildLayout(context, isMobile: false),
    );
  }

  Widget _buildLayout(BuildContext context, {required bool isMobile}) {
    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKey,
        // Drawer tetap ada untuk mobile
        drawer: isMobile ? Drawer(child: _sidebar(isMobile: true)) : null,
        body: Stack(
          children: [
            // LAYER 1: Layout Dasar (Sidebar + Konten)
            Row(
              children: [
                if (!isMobile) _sidebar(isMobile: false),
                Expanded(
                  child: Container(
                    color: const Color(0xFFF8FAFC),
                    child: body, // Konten dashboard utama
                  ),
                ),
              ],
            ),

            // LAYER 2: Fixed IconButton Menu (Hanya Mobile)
            if (isMobile)
              Positioned(
                left: 20,
                top: (Get.height / 2) - 24,
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  // INI CARA PALING GAMPANG:
                  hoverColor: controller.currentTheme['selected'],
                  color:
                      controller.currentTheme['hovered'], // Warna icon default
                  onPressed: () =>
                      controller.scaffoldKey.currentState?.openDrawer(),
                ),
              ),

            // LAYER 3: Draggable Profile Dropdown (Fixed Absolute)
            Positioned(
              top: controller.profileOffset.value.dy,
              right: controller.profileOffset.value.dx,
              child: Draggable(
                feedback: Material(
                  color: Colors.transparent,
                  child: Opacity(opacity: 0.8, child: _buildProfileDropdown()),
                ),
                childWhenDragging: Container(),
                onDragEnd: (details) {
                  // Hitung koordinat baru agar tetap nempel di kanan
                  double newRight =
                      MediaQuery.of(context).size.width -
                      details.offset.dx -
                      50;
                  double newTop = details.offset.dy;

                  // Safety check agar tidak keluar layar
                  if (newTop < 10) newTop = 16;
                  if (newRight < 10) newRight = 16;

                  controller.updateOffset(Offset(newRight, newTop));
                },
                child: _buildProfileDropdown(),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _sidebar({required bool isMobile}) {
    final theme = controller.currentTheme;

    // FORCE false kalau mobile, jadi sidebar di Drawer nggak bakal menciut
    final isCollapsed = isMobile ? false : controller.isCollapsed.value;

    return Container(
      // Sekarang lebarnya bakal konsisten 280 kalau mobile
      width: isMobile ? 280 : (isCollapsed ? 80 : 260),
      color: theme['sidebar'],
      child: Column(
        children: [
          // Header Logo
          Container(
            height: 64,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme['sidebarCard'],
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              isCollapsed ? "S" : "Sekolah", // Kalau mobile, otomatis "Sekolah"
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // List Menu
          Expanded(child: ListView(children: menuItems)),

          // Tombol Collapse (Hanya muncul di Desktop)
          if (!isMobile)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  isCollapsed ? Icons.first_page : Icons.last_page,
                  color: controller.themeColor.value == 'putih'
                      ? Colors.grey
                      : Colors.white,
                ),
                onPressed: () => controller.toggleSidebar(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _appBar(bool isMobile) {
    final theme = controller.currentTheme;
    final textColor = controller.themeColor.value == 'putih'
        ? theme['text']!
        : Colors.white;

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme['header'],
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          if (isMobile)
            IconButton(
              icon: Icon(Icons.menu, color: textColor),
              onPressed: () =>
                  controller.scaffoldKey.currentState?.openDrawer(),
            ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: textColor,
            ),
          ),
          const Spacer(),

          // THEME SELECTOR
          const SizedBox(width: 16),
          _buildLevelSelector(),
          const SizedBox(width: 16),
          // PROFILE POPOVER (SHADCN)
          _buildProfileDropdown(),
        ],
      ),
    );
  }

  Widget _buildThemeSelector() {
    return SizedBox(
      width: 110,
      child: ShadSelect<String>(
        initialValue: controller.themeColor.value,
        onChanged: controller.changeTheme,
        decoration: const ShadDecoration(
          border: ShadBorder.none,

          focusedBorder: ShadBorder.none, // Hilangkan border saat fokus
        ),

        // TAMBAHKAN <ShadOption<String>> di sini agar tipenya jelas
        options: controller.themes.keys
            .map<ShadOption<String>>(
              (t) => ShadOption<String>(value: t, child: Text(_capitalize(t))),
            )
            .toList(),
        selectedOptionBuilder: (context, value) => Text(_capitalize(value)),
      ),
    );
  }

  Widget _buildLevelSelector() {
    return Obx(() {
      // Tampilkan loading atau empty state jika data belum siap
      if (masterController.profileSchoolLevels.isEmpty) {
        return const SizedBox.shrink();
      }

      return SizedBox(
        width: 110,
        child: ShadSelect<String>(
          // Gunakan .value dari obs
          initialValue: masterController.levelAccessProfileId.value,
          onChanged: (String? value) {
            if (value != null) {
              // Update state global saat user memilih level lain
              masterController.levelAccessProfileId.value = value;
              print(
                "Level Aktif: ${masterController.levelAccessProfileId.value}",
              );

              // Opsional: Panggil fungsi refresh data modul lain di sini jika perlu
            }
          },
          decoration: const ShadDecoration(
            border: ShadBorder.none,
            focusedBorder: ShadBorder.none,
          ),
          options: masterController.profileSchoolLevels
              .map<ShadOption<String>>(
                (level) => ShadOption<String>(
                  value: level.id,
                  child: Text(level.name.toUpperCase()),
                ),
              )
              .toList(),
          selectedOptionBuilder: (context, value) {
            // Cari item yang terpilih untuk ditampilkan teksnya
            final selected = masterController.profileSchoolLevels.firstWhere(
              (e) => e.id == value,
              orElse: () => masterController.profileSchoolLevels.first,
            );
            return Text(selected.name.toUpperCase());
          },
        ),
      );
    });
  }

  Widget _buildProfileDropdown() {
    return ShadPopover(
      controller: popoverController,
      popover: (context) => SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "My Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 14),
                Text("Tema", style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 12),
                _buildThemeSelector(),
              ],
            ),
            _popoverItem(Icons.person_outline, "Profile", () {
              final currentPath = Get.currentRoute;
              Get.rootDelegate.toNamed('$currentPath/profile');
            }),
            _popoverItem(Icons.settings_outlined, "Settings", () {
              print("ke Settings");
            }),
            const Divider(height: 1),
            _popoverItem(Icons.logout_rounded, "Logout", () async {
              await controller.logout();
            }, textColor: Colors.red),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () => popoverController.toggle(),
        child: GlobalAvatar(
          imageUrl: controller.profile.userData.value?.imageUrl,
          size: 50,
          borderWidth: 1,
          borderColor: const Color(0xFF64b5f6),
        ),
      ),
    );
  }

  Widget _popoverItem(
    IconData icon,
    String label,
    VoidCallback onTap, {
    Color? textColor,
  }) {
    return ShadButton.ghost(
      width: double.infinity,
      mainAxisAlignment: MainAxisAlignment.start,
      onPressed: () {
        popoverController.hide();
        onTap();
      },
      child: Row(
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(color: textColor, fontSize: 14)),
        ],
      ),
    );
  }
}
