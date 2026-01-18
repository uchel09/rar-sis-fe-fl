import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../core/responsive_wrapper.dart';

class MainDashboardLayout extends StatelessWidget {
  final String title;
  final List<Widget> menuItems;
  final Widget body;
  final dynamic controller; // Harus extends BaseDashboardController
  final GlobalKey<ScaffoldState> scaffoldKey;

  // Controller untuk ShadPopover
  final popoverController = ShadPopoverController();

  MainDashboardLayout({
    super.key,
    required this.title,
    required this.menuItems,
    required this.body,
    required this.controller,
    required this.scaffoldKey,
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
      tablet: (context) => _buildLayout(context, isMobile: false),
      desktop: (context) => _buildLayout(context, isMobile: false),
    );
  }

  Widget _buildLayout(BuildContext context, {required bool isMobile}) {
    return Obx(() {
      final theme = controller.currentTheme;
      return Scaffold(
        key: scaffoldKey,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Buka Modal Create Admin (Mapping Manual 11 field)
        //     Get.toNamed('/login');
        //   },
        //   backgroundColor: Colors.blueAccent,
        //   child: Center(child: const Text("Back")),
        // ),
        // Drawer hanya untuk mobile
        drawer: isMobile ? Drawer(child: _sidebar(isMobile: true)) : null,
        body: Row(
          children: [
            // Sidebar untuk Desktop/Tablet
            if (!isMobile) _sidebar(isMobile: false),
            Expanded(
              child: Column(
                children: [
                  _appBar(isMobile),
                  // Background body agar terlihat kontras dengan card
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF8FAFC),
                      child: body,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _sidebar({required bool isMobile}) {
    final theme = controller.currentTheme;
    final isCollapsed = controller.isCollapsed.value && !isMobile;

    return Container(
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
              isCollapsed ? "S" : "Sekolah",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // List Menu
          Expanded(child: ListView(children: menuItems)),

          // Tombol Collapse di bawah (Hanya Desktop)
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
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
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
          _buildThemeSelector(),
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
            _popoverItem(Icons.person_outline, "Profile", () {
              print("ke Profile");
            }),
            _popoverItem(Icons.settings_outlined, "Settings", () {
              print("ke Settings");
            }),
            const Divider(height: 1),
            _popoverItem(
              Icons.logout_rounded,
              "Logout",
              () => controller.logout(),
              textColor: Colors.red,
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () => popoverController.toggle(),
        child: const ShadAvatar(
          'https://github.com/shadcn.png',
          placeholder: Text('AD'),
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
