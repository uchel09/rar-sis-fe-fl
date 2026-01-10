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
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Icon(icon, color: theme['text'], size: 20),
      );
    }

    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: Icon(icon, size: 20, color: theme['text']),
        key: PageStorageKey(id), // Tips: Bantu Flutter ingat posisi scroll
        initiallyExpanded: controller.openMenuId.value == id,
        onExpansionChanged: (isOpen) {
          if (isOpen)
            controller.openMenuId.value = id;
          else if (controller.openMenuId.value == id)
            controller.openMenuId.value = "";
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
    required String label,
    required String id,
    required dynamic controller,
    required VoidCallback onTap,
  }) {
    return Obx(() {
      final isSelected = controller.activeMenuKey.value == id;
      final theme = controller.currentTheme;

      return Padding(
        padding: const EdgeInsets.only(left: 44, right: 12, bottom: 2),
        child: ShadButton.ghost(
          width: double.infinity,
          mainAxisAlignment: MainAxisAlignment.start,
          backgroundColor: isSelected ? theme['selected'] : null,
          onPressed: onTap,
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
