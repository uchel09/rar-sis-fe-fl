import 'package:get/get.dart';
import '../../modules/profile/controllers/profile_controller.dart';

// Base-nya lu buat sekali aja di folder core/base
abstract class BaseDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController()); // Standar profil buat semua dashboard
    injectController(); // Panggil method abstrak
  }

  void injectController();
}

// Terus di modul Admin lu (Ubah extend Bindings jadi BaseDashboardBinding)
