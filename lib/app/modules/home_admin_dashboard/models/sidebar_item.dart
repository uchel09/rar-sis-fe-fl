import 'package:flutter/material.dart';

class SidebarItem {
  final String title; // label menu
  final IconData icon; // icon menu
  final String route; // route untuk Get.toNamed()
  final List<SidebarItem>? children; // sub-menu

  SidebarItem({
    required this.title,
    required this.icon,
    this.route = '',
    this.children,
  });
}
