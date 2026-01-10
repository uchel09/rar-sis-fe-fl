import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:rar_sis_fe_fl/app/controllers/school_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await GetStorage.init();

  // INJEKSI DIO DI SINI (Menjawab error "Dio not found")
  Get.put(
    Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000',
        connectTimeout: const Duration(seconds: 10),
      ),
    ),
    permanent: true,
  );

  Get.put(SchoolController(), permanent: true);
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita gunakan ShadApp sebagai pembungkus utama,
    // dan GetMaterialApp di dalamnya, tapi dengan trik 'builder'
    return ShadApp(
      debugShowCheckedModeBanner: false,
      home: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'School Management',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        // Ini kunci agar Shadcn UI bisa merender Overlay (seperti Select/Modal)
        // di atas halaman GetX Anda
        builder: (context, child) {
          return child!;
        },
      ),
    );
  }
}
