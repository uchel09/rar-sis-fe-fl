import 'package:flutter/material.dart';
import '../../../modules/home_admin_dashboard/models/sidebar_item.dart';
import '../../../modules/home_admin_dashboard/views/sidebar.dart';
import '../../../modules/home_admin_dashboard/views/header.dart';
import '../../../core/responsive_wrapper.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  final List<SidebarItem> sidebarItems;

  const DashboardLayout({
    super.key,
    required this.child,
    required this.sidebarItems,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      mobile: (context) => Scaffold(
        drawer: Sidebar(items: sidebarItems),
        body: Column(
          children: [
            Header(), // Obx hanya di Header
            Expanded(child: child),
          ],
        ),
      ),
      tablet: (context) => Scaffold(
        body: Row(
          children: [
            Container(width: 250, child: Sidebar(items: sidebarItems)),
            Expanded(
              child: Column(
                children: [
                  Header(), // Obx hanya di Header
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
      desktop: (context) => Scaffold(
        body: Row(
          children: [
            Container(width: 250, child: Sidebar(items: sidebarItems)),
            Expanded(
              child: Column(
                children: [
                  Header(), // Obx hanya di Header
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
