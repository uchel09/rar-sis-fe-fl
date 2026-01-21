// lib/app/modules/profile/controllers/profile_controller.dart
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rar_sis_fe_fl/app/services/auth/auth_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:get_storage/get_storage.dart';
import '../../../services/auth/auth_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:image/image.dart' as img;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';
// import '../../../services/auth/auth_service.dart';
// import '../../../services/auth/auth_model.dart';
import '../../../providers/base_api_service.dart';

class ProfileController extends GetxController {
  final BaseApiService _apiProvider = Get.find<BaseApiService>();
  final AuthService _authService = Get.find<AuthService>();
  final box = GetStorage(); // Langsung panggil box di sini
  final cropController = CropController();
  // Form Keys
  final profileFormKey = GlobalKey<ShadFormState>();
  final passwordFormKey = GlobalKey<ShadFormState>();

  // State
  var isLoading = false.obs;
  var isImageLoading = false.obs;
  var isProcessing = false.obs; // Untuk status di dalam dialog
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
    _loadDataFromStorage();
  }

  void _initializeEmptyControllers() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  // --- AMBIL DATA DARI STORAGE ---
  void _loadDataFromStorage() {
    final rawData = box.read('profile');

    if (rawData != null) {
      print("ProfileController: Ambil dari Box -> ${rawData['fullName']}");
      final user = UserProfileModel.fromJson(rawData);

      // Update State & Controllers
      userData.value = user;
      nameController.text = user.fullName;
      emailController.text = user.email;
    }
  }

  // --- REFRESH / FETCH API ---
  Future<void> refreshProfileData() async {
    try {
      await _authService.fetchMe();
    } finally {
      _loadDataFromStorage();
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
    } finally {
      isLoading.value = false;
    }
  }

  // --- UPLOAD IMAGE ---
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      // FILTER AWAL: Kecilkan di level Native agar RAM aman
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final int bytes = await image.length();
      final double sizeInMB = bytes / (1024 * 1024);
      isImageLoading.value = true;
      final Uint8List originalBytes = await image.readAsBytes();

      // Beri jeda dikit biar memori napas sebelum buka dialog
      await Future.delayed(const Duration(milliseconds: 200));
      if (sizeInMB > 2.0) {
        // Langsung stop di sini kalau lebih dari 2MB
        Get.snackbar(
          "File Terlalu Besar",
          "Ukuran file kamu ${sizeInMB.toStringAsFixed(2)} MB. Maksimal hanya boleh 2 MB cok!",
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
        );
        return;
      }
      _showCropDialog(originalBytes, image.name);
    } catch (e) {
      print("LOG ERROR: $e");
      Get.snackbar("Error", "Gagal memuat gambar");
    } finally {
      isImageLoading.value = false;
    }
  }

  void _showCropDialog(Uint8List bytes, String fileName) {
    showShadDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => ShadDialog(
        title: const Text('Atur Posisi Foto'),
        description: const Text('Geser dan zoom foto agar pas.'),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.8,
            maxHeight: 400,
          ),
          child: Crop(
            key: UniqueKey(),
            image: bytes,
            controller: cropController,
            onCropped: (result) {
              if (result is CropSuccess) {
                _uploadCroppedImage(result.croppedImage, fileName);
              }
            },
            aspectRatio: 1 / 1,
            interactive: true,
            withCircleUi: true,
            baseColor: Colors.white,
            maskColor: Colors.black.withOpacity(0.5),
          ),
        ),
        actions: [
          ShadButton.outline(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Batal"),
          ),
          ShadButton(
            child: const Text('Simpan & Upload'),
            onPressed: () {
              cropController.crop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _uploadCroppedImage(
    Uint8List croppedBytes,
    String originalName,
  ) async {
    isImageLoading.value = true;
    try {
      final dir = await getTemporaryDirectory();
      final String fileName =
          "${originalName.split('.').first}_${DateTime.now().millisecondsSinceEpoch}.jpg";
      final String savePath = "${dir.path}/$fileName";

      img.Image? decoded = img.decodeImage(croppedBytes);
      if (decoded == null) throw "Gagal memproses gambar";

      // Validasi resolusi sesuai request kamu

      // Kompresi JPG (Target di bawah 1MB sesuai request sebelumnya)
      final jpgBytes = img.encodeJpg(decoded, quality: 40);
      File fileToUpload = await File(savePath).writeAsBytes(jpgBytes);
      print("UKURAN AKHIR JPG: ${fileToUpload.lengthSync() / 1024} KB");
      // Kirim FormData
      dio.FormData formData = dio.FormData.fromMap({
        "file": await dio.MultipartFile.fromFile(
          fileToUpload.path,
          filename: fileName,
          contentType: dio.DioMediaType('image', 'jpeg'),
        ),
      });

      await _apiProvider.dio.post('/users/upload-avatar', data: formData);

      Get.back(); // Tutup dialog
      await refreshProfileData(); // Mapping manual di service

      Get.snackbar("Sukses", "Foto profil diperbarui");
    } catch (e) {
      // Kalau error, dialog jangan ditutup biar user bisa coba lagi/ganti foto
      Get.snackbar("Error", e.toString());
    } finally {
      isImageLoading.value = false;
    }
  }

  // Future<void> pickAndUploadImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  //   if (image == null) return;

  //   isImageLoading.value = true;
  //   try {
  //     // Ambil folder temp
  //     final dir = await getTemporaryDirectory();

  //     // Ambil nama asli tanpa ekstensi + ganti ke .webp
  //     String originalName = image.name.split('.').first;
  //     String webpFileName =
  //         "${originalName}_${DateTime.now().millisecondsSinceEpoch}.webp";
  //     final String tempPath = "${dir.path}/$webpFileName";

  //     // PROSES KOMPRESI
  //     // Jika masih "Unimplemented", cek langkah di bawah kode ini
  //     XFile? result = await FlutterImageCompress.compressAndGetFile(
  //       image.path,
  //       tempPath,
  //       format: CompressFormat.webp,
  //       quality: 50,
  //     );

  //     if (result == null) throw "Gagal kompres gambar";

  //     // HANYA KIRIM FILE (Sesuai request backend lu)
  //     dio.FormData formData = dio.FormData.fromMap({
  //       "file": await dio.MultipartFile.fromFile(
  //         result.path,
  //         filename: webpFileName,
  //         contentType: dio.DioMediaType('image', 'webp'),
  //       ),
  //     });

  //     await _apiProvider.dio.post('/users/upload-avatar', data: formData);

  //     await refreshProfileData();
  //     Get.snackbar("Sukses", "Foto profil diperbarui");
  //   } catch (e) {
  //     print("LOG ERROR: $e");
  //     Get.snackbar("Error", "Gagal upload: $e");
  //   } finally {
  //     isImageLoading.value = false;
  //   }
  // }

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
