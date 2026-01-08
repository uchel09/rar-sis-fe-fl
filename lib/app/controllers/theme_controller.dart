import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ThemeColor { putih, hijau, pink, biru }

class ThemeController extends GetxController {
  Rx<ThemeColor> currentTheme = ThemeColor.putih.obs;

  // ThemeData global untuk MaterialApp
  ThemeData get themeData {
    switch (currentTheme.value) {
      case ThemeColor.hijau:
        return ThemeData(
          primaryColor: Color(0xFF11D868),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF11D868),
            foregroundColor: Colors.white,
          ),
        );
      case ThemeColor.pink:
        return ThemeData(
          primaryColor: Color(0xFFF97FCE),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFF97FCE),
            foregroundColor: Colors.white,
          ),
        );
      case ThemeColor.biru:
        return ThemeData(
          primaryColor: Color(0xFF90CAF9),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF90CAF9),
            foregroundColor: Colors.white,
          ),
        );
      case ThemeColor.putih:
      default:
        return ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Color(0xFFF5F5F5),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
          ),
        );
    }
  }

  // Ganti tema
  void setTheme(ThemeColor theme) {
    currentTheme.value = theme;
  }
}
