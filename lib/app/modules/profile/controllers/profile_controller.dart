// lib/app/modules/profile/controllers/profile_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:get_storage/get_storage.dart';
import '../../../services/auth/auth_model.dart';

import 'package:dio/dio.dart' as dio;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';
// import '../../../services/auth/auth_service.dart';
// import '../../../services/auth/auth_model.dart';
import '../../../providers/base_api_service.dart';

class ProfileController extends GetxController {
  final BaseApiService _apiProvider = Get.find<BaseApiService>();
  final box = GetStorage(); // Langsung panggil box di sini

  // Form Keys
  final profileFormKey = GlobalKey<ShadFormState>();
  final passwordFormKey = GlobalKey<ShadFormState>();

  // State
  var isLoading = false.obs;
  var isImageLoading = false.obs;
  final userData = Rxn<UserProfileModel>(); // Tetap Rxn biar UI Obx lu gak mati
  var selectedImageFile = Rxn<XFile>();

  // Text Controllers
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    _initializeEmptyControllers();

    // LANGSUNG AMBIL DARI BOX
    loadDataFromStorage();
  }

  void _initializeEmptyControllers() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  // --- AMBIL DATA DARI STORAGE ---
  void loadDataFromStorage() {
    final rawData = box.read('profile');
    if (rawData != null) {
      print("ProfileController: Ambil dari Box -> ${rawData['fullName']}");
      final user = UserProfileModel.fromJson(rawData);

      // Update State & Controllers
      userData.value = user;
      nameController.text = user.fullName;
      emailController.text = user.email;
    } else {
      // Kalau box kosong, baru paksa fetch dari API
      refreshProfileData();
    }
  }

  // --- REFRESH / FETCH API ---
  Future<void> refreshProfileData() async {
    try {
      final response = await _apiProvider.dio.get('/users/me');
      final rawDataMap = response.data["data"];

      // Tulis ke Box
      await box.write('profile', rawDataMap);

      // Load ulang ke UI
      loadDataFromStorage();
    } catch (e) {
      print("Error Fetch: $e");
    }
  }

  // --- UPDATE GENERAL INFO ---
  Future<void> updateGeneralInfo() async {
    if (!profileFormKey.currentState!.validate()) return;

    isLoading.value = true;
    try {
      final Map<String, dynamic> payload = {
        "fullName": nameController.text.trim(),
        "email": emailController.text.trim(),
      };

      final response = await _apiProvider.dio.patch(
        '/users/profile',
        data: payload,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Berhasil update -> Refresh storage & UI
        await refreshProfileData();
        Get.snackbar("Sukses", "Profil diperbarui");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal update profil");
    } finally {
      isLoading.value = false;
    }
  }

  // --- UPLOAD IMAGE ---
  Future<void> pickAndUploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      isImageLoading.value = true;
      try {
        String fileName = image.path.split('/').last;
        dio.FormData formData = dio.FormData.fromMap({
          "file": await dio.MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        });

        await _apiProvider.dio.post('/users/upload-avatar', data: formData);

        // Refresh storage biar foto profil baru muncul
        await refreshProfileData();
      } catch (e) {
        Get.snackbar("Error", "Gagal upload");
      } finally {
        isImageLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
