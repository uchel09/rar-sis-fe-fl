import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DashboardComponents {
  // --- 1. MENU UTAMA (TOP LEVEL) ---
  static Widget menuItem({
    required IconData icon,
    required String label,
    required String id,
    required bool isCollapsed,
    required dynamic controller,
    VoidCallback? onTap,
  }) {
    return Obx(() {
      final theme = controller.currentTheme;
      final isSelected = controller.activeMenuKey.value == id;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ShadButton.ghost(
          width: double.infinity,
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
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.clip,
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

  // --- 2. MENU DROPDOWN (EXPANSION) ---
  // --- 2. MENU DROPDOWN (EXPANSION) ---
  static Widget expansionMenu({
    required IconData icon,
    required String id,
    required String label,
    required List<Widget> children,
    required bool isCollapsed,
    required dynamic controller,
  }) {
    final theme = controller.currentTheme;

    if (isCollapsed) {
      final popoverController = ShadPopoverController();
      // GANTI INI:

      return MouseRegion(
        onEnter: (_) => popoverController.show(),
        onExit: (_) => popoverController.hide(),
        child: ShadPopover(
          controller: popoverController,
          groupId: id, // Gunakan ID unik dari parameter lo
          anchor: const ShadAnchor(
            overlayAlignment: Alignment.centerRight,
            childAlignment: Alignment.centerLeft,
            offset: Offset(-20, 0),
          ),
          popover: (context) => MouseRegion(
            onEnter: (_) => popoverController.show(),
            onExit: (_) => popoverController.hide(),
            child: Container(
              width: 180,
              // --- FIX OVERFLOW: Bungkus Column pake ConstrainedBox + Scroll ---
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: theme['sidebar'],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white10),
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 350,
                  ), // Batas tinggi biar gak overflow
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Center(
                            child: Text(
                              label,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          color: Color.fromARGB(255, 216, 215, 215),
                        ),
                        SizedBox(height: 10),
                        ...children,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // --- FIX markNeedsBuild: Hapus Obx di sini, pakai value langsung ---
          child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Obx(() {
              // Kita ambil valuenya di sini, tapi jangan lakuin assignment apa pun
              final currentActive = controller.parentActive.value;
              final isSelected = currentActive == label;

              return Icon(
                icon,
                color: isSelected ? theme["selected"] : theme['text'],
                size: 20,
              );
            }),
          ),
        ),
      );
    }

    // --- Tampilan Normal (ExpansionTile) ---
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: Icon(icon, size: 20, color: theme['text']),
        key: PageStorageKey(id),
        initiallyExpanded: controller.openMenuId.value == id,
        onExpansionChanged: (isOpen) {
          if (isOpen) {
            controller.openMenuId.value = id;
          } else if (controller.openMenuId.value == id) {
            controller.openMenuId.value = "";
          }
        },
        title: Text(
          label,
          style: TextStyle(color: theme['text'], fontSize: 14),
        ),
        iconColor: theme['text'],
        collapsedIconColor: theme['text'],
        children: children,
      ),
    );
  }

  // --- 3. SUB MENU ITEM (UNTUK DI DALAM EXPANSION) ---
  static Widget subMenuItem({
    String? parentMenu,
    required String label,
    required String id,
    required dynamic controller,
    required VoidCallback onTap,
  }) {
    return Obx(() {
      final isSelected = controller.activeMenuKey.value == id;
      final theme = controller.currentTheme;
      if (parentMenu != null && isSelected) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (controller.parentActive.value != parentMenu) {
            controller.parentActive.value = parentMenu;
          }
        });
      }

      return Padding(
        // MODIFIKASI: Padding disesuaikan biar pas di Sidebar & Popover
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: ShadButton.ghost(
          width: double.infinity,
          mainAxisAlignment: MainAxisAlignment.start,
          // Pakai withValues (standard baru Flutter)
          backgroundColor: isSelected ? theme['selected'] : null,
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 8), // Indentasi teks
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : theme['text']!.withValues(alpha: 0.7), // FIX DEPRECATED
                fontSize: 13,
              ),
            ),
          ),
        ),
      );
    });
  }

  // --- 4. STAT CARD (OVERVIEW) ---
  static Widget statCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
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
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
