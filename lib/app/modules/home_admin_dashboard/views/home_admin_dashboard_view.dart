import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../core/responsive_wrapper.dart';
import '../controllers/home_admin_dashboard_controller.dart';

class HomeAdminDashboardView extends GetView<HomeAdminDashboardController> {
  // 1. GlobalKey untuk mengontrol Scaffold (Penting untuk Drawer di Mobile)
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final popoverController = ShadPopoverController();
  HomeAdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      // Tampilan Mobile & Tablet (Hamburger Menu)
      mobile: (context) => _buildMobileLayout(context),
      tablet: (context) => _buildDesktopLayout(context),

      // Tampilan Desktop (Sidebar Menempel)
      desktop: (context) => _buildDesktopLayout(context),
    );
  }

  // --- LAYOUT: MOBILE & TABLET ---
  // --- LAYOUT: MOBILE & TABLET ---
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildSidebar(context, isMobile: true),
      body: SizedBox(
        height: MediaQuery.of(context).size.height, // Kunci tinggi layar
        child: Column(
          // Baris 49
          children: [
            _buildAppBar(context, isMobile: true),
            // WAJIB: Expanded agar MainContent tidak meledak tingginya
            Expanded(child: _buildMainContent(context)),
          ],
        ),
      ),
    );
  }

  // --- LAYOUT: DESKTOP ---
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(context, isMobile: false),
          Expanded(
            // Memberi batas lebar sisa layar
            child: Column(
              children: [
                _buildAppBar(context, isMobile: false),
                // WAJIB: Expanded agar MainContent tidak meledak tingginya
                Expanded(child: _buildMainContent(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- COMPONENT: APP BAR ---
  Widget _buildAppBar(BuildContext context, {required bool isMobile}) {
    return Obx(() {
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
            IconButton(
              icon: Icon(
                isMobile ? LucideIcons.menu : LucideIcons.panelLeft,
                color: textColor,
              ),
              onPressed: () {
                if (isMobile) {
                  _scaffoldKey.currentState?.openDrawer();
                } else {
                  controller.toggleSidebar();
                }
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                "Dashboard Admin",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            _buildThemeSelector(),
            const SizedBox(width: 16),
            Icon(LucideIcons.bell, color: textColor, size: 20),
            const SizedBox(width: 16),

            // --- DROPDOWN PROFILE START ---
            ShadPopover(
              controller: popoverController,

              popover: (context) => SizedBox(
                width: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "My Account",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "admin@sekolah.id",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    _buildPopoverItem(
                      icon: LucideIcons.user,
                      label: "Profile",
                      onTap: () => print("Ke Profil"),
                    ),
                    _buildPopoverItem(
                      icon: LucideIcons.settings,
                      label: "Settings",
                      onTap: () => print("Ke Settings"),
                    ),
                    const Divider(height: 1),
                    _buildPopoverItem(
                      icon: LucideIcons.logOut,
                      label: "Logout",
                      textColor: Colors.red,
                      onTap: () => controller.logout(),
                    ),
                  ],
                ),
              ),
              child: GestureDetector(
                // TAMBAHKAN INI SEBAGAI TRIGGER
                onTap: () => popoverController.toggle(),
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ShadAvatar(
                    'https://github.com/shadcn.png',
                    placeholder: Text('AD'),
                  ),
                ),
              ),
            ),
            // --- DROPDOWN PROFILE END ---
          ],
        ),
      );
    });
  }

  // Helper untuk item di dalam popover agar tidak mengulang kode
  Widget _buildPopoverItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ShadButton.ghost(
      width: double.infinity,
      mainAxisAlignment: MainAxisAlignment.start,
      onPressed: () {
        popoverController.hide(); // TUTUP POPOVER MENGGUNAKAN CONTROLLER
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

  // --- COMPONENT: SIDEBAR ---
  // --- COMPONENT: SIDEBAR ---
  Widget _buildSidebar(BuildContext context, {required bool isMobile}) {
    return Obx(() {
      final theme = controller.currentTheme;
      final isCollapsed = controller.isCollapsed.value && !isMobile;
      final width = isMobile ? 280.0 : (isCollapsed ? 80.0 : 260.0);

      Widget sidebarContent = Container(
        width: width,
        height: double.infinity,
        color: theme['sidebar'],
        child: Column(
          children: [
            _buildSidebarHeader(isCollapsed, theme),

            Expanded(child: _buildSidebarMenu(isCollapsed)),

            const Divider(height: 1),

            // TOMBOL COLLAPSE (Hanya muncul di Desktop/Tablet)
            if (!isMobile)
              _menuItem(
                icon: isCollapsed
                    ? LucideIcons.panelRight
                    : LucideIcons.panelLeft,
                label: "Kecilkan Menu",
                id: "collapse_toggle",
                isCollapsed: isCollapsed,
                onTap: () => controller.toggleSidebar(),
              ),

            const SizedBox(height: 10),
          ],
        ),
      );

      return isMobile ? Drawer(child: sidebarContent) : sidebarContent;
    });
  }

  // --- HELPER: SIDEBAR HEADER ---
  Widget _buildSidebarHeader(bool isCollapsed, Map<String, Color> theme) {
    return Container(
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
          fontSize: 18,
        ),
      ),
    );
  }

  // --- COMPONENT: SIDEBAR MENU ---
  Widget _buildSidebarMenu(bool isCollapsed) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _menuItem(
          icon: LucideIcons.layoutDashboard,
          label: "Dashboard",
          id: "1",
          isCollapsed: isCollapsed,
        ),
        _expansionMenu(
          icon: LucideIcons.bookOpen,
          label: "Akademik",
          isCollapsed: isCollapsed,
          children: [
            _subMenuItem(label: "Siswa", id: "2-1"),
            _subMenuItem(label: "Guru", id: "2-2"),
            _subMenuItem(label: "Kelas", id: "2-3"),
          ],
        ),
        _expansionMenu(
          icon: LucideIcons.graduationCap,
          label: "Administrasi",
          isCollapsed: isCollapsed,
          children: [
            _subMenuItem(label: "Pembayaran SPP", id: "3-1"),
            _subMenuItem(label: "Inventaris", id: "3-2"),
          ],
        ),
      ],
    );
  }

  // --- COMPONENT: MAIN CONTENT ---
  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dashboard Overview",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1000
                  ? 4
                  : (constraints.maxWidth > 600 ? 2 : 1);
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.5,
                children: [
                  _statCard(
                    "Total Siswa",
                    "1,240",
                    LucideIcons.users,
                    Colors.blue,
                  ),
                  _statCard(
                    "Guru Aktif",
                    "86",
                    LucideIcons.graduationCap,
                    Colors.green,
                  ),
                  _statCard(
                    "Tagihan SPP",
                    "12jt",
                    LucideIcons.creditCard,
                    Colors.orange,
                  ),
                  _statCard(
                    "Hadir Hari Ini",
                    "98%",
                    LucideIcons.circleCheck,
                    Colors.purple,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS (Theme Selector, Menu Item, etc.) ---

  Widget _buildThemeSelector() {
    return Obx(
      () => SizedBox(
        width: 110,
        child: ShadSelect<String>(
          initialValue: controller.themeColor.value,
          selectedOptionBuilder: (context, value) =>
              Text(value.capitalizeFirst!),
          options: controller.themes.keys
              .map(
                (theme) => ShadOption(
                  value: theme,
                  child: Text(theme.capitalizeFirst!),
                ),
              )
              .toList(),
          onChanged: controller.changeTheme,
        ),
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String label,
    required String id,
    required bool isCollapsed,
    VoidCallback? onTap,
  }) {
    return Obx(() {
      final theme = controller.currentTheme;
      final isSelected = controller.activeMenuKey.value == id;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ShadButton.ghost(
          width: double.infinity,
          // Jika kecil, taruh di tengah (Center), jika lebar taruh di kiri (Start)
          mainAxisAlignment: isCollapsed
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          backgroundColor: isSelected ? theme['selected'] : null,
          onPressed: onTap ?? () => controller.activeMenuKey.value = id,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected ? Colors.white : theme['text'],
              ),
              if (!isCollapsed) ...[
                const SizedBox(width: 12),
                // Gunakan Flexible agar teks tidak overflow saat sidebar sedang transisi
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isSelected ? Colors.white : theme['text'],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _expansionMenu({
    required IconData icon,
    required String label,
    required List<Widget> children,
    required bool isCollapsed,
  }) {
    if (isCollapsed) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Icon(icon, color: controller.currentTheme['text']),
      );
    }
    return Theme(
      data: Theme.of(Get.context!).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Icon(icon, size: 20, color: controller.currentTheme['text']),
        title: Text(
          label,
          style: TextStyle(
            color: controller.currentTheme['text'],
            fontSize: 14,
          ),
        ),
        children: children,
      ),
    );
  }

  Widget _subMenuItem({required String label, required String id}) {
    return Obx(() {
      final isSelected = controller.activeMenuKey.value == id;
      final theme = controller.currentTheme;
      return Padding(
        padding: const EdgeInsets.only(left: 44, right: 12, bottom: 2),
        child: ShadButton.ghost(
          width: double.infinity,
          mainAxisAlignment: MainAxisAlignment.start,
          backgroundColor: isSelected ? theme['selected'] : null,
          onPressed: () => controller.activeMenuKey.value = id,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : theme['text']!.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ),
      );
    });
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return ShadCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
