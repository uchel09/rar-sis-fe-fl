import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/sidebar_item.dart';

class Sidebar extends StatelessWidget {
  final List<SidebarItem> items;
  const Sidebar({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items.map((item) {
        if (item.children != null && item.children!.isNotEmpty) {
          return ExpansionTile(
            leading: Icon(item.icon, color: Colors.white),
            title: Text(item.title, style: TextStyle(color: Colors.white)),
            children: item.children!.map((child) {
              return ListTile(
                leading: Icon(child.icon, color: Colors.white70),
                title: Text(
                  child.title,
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  if (child.route.isNotEmpty) Get.toNamed(child.route);
                },
              );
            }).toList(),
          );
        }
        return ListTile(
          leading: Icon(item.icon, color: Colors.white),
          title: Text(item.title, style: TextStyle(color: Colors.white)),
          onTap: () {
            if (item.route.isNotEmpty) Get.toNamed(item.route);
          },
        );
      }).toList(),
    );
  }
}
