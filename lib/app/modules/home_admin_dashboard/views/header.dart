import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/theme_controller.dart';

class Header extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: themeController.themeData.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dashboard Admin",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              DropdownButton<int>(
                value: 1,
                items: [
                  DropdownMenuItem(value: 1, child: Text("Putih")),
                  DropdownMenuItem(value: 2, child: Text("Hijau")),
                ],
                onChanged: (val) {},
              ),
              SizedBox(width: 16),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications, color: Colors.white),
              ),
              PopupMenuButton<String>(
                onSelected: (val) {
                  if (val == "logout") Get.offAllNamed('/login');
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: "profile", child: Text("Profil")),
                  PopupMenuItem(value: "settings", child: Text("Pengaturan")),
                  PopupMenuItem(value: "logout", child: Text("Keluar")),
                ],
                icon: CircleAvatar(child: Icon(Icons.person)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
