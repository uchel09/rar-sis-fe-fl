import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DriveHelper {
  // Fungsi static: Langsung panggil DriveHelper.getImageUrl(id)
  static String getImageUrl(String? fileId) {
    // 1. Kalau ID kosong, kasih foto default (biar gak error)
    if (fileId == null || fileId.isEmpty) {
      return 'https://github.com/shadcn.png';
    }

    // 2. Format URL khusus buat nampilin gambar dari Google Drive
    // uc?export=view adalah cara supaya gambarnya bisa diakses langsung sebagai file image
    return "https://docs.google.com/uc?export=view&id=$fileId";
  }

  static Future<void> openFile(String fileId) async {
    final String url =
        "https://drive.google.com/file/d/$fileId/view?usp=sharing";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Tidak bisa membuka file");
    }
  }
}
