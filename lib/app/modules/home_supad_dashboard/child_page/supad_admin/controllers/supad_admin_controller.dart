import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../../services/school_admin/school_admin_model.dart';
import '../../../../../services/school_admin/school_admin_service.dart';

class SupadAdminController extends GetxController {
  final _service = Get.find<SchoolAdminService>();
  final isLoading = false.obs;
  final formKey = GlobalKey<ShadFormState>();

  List<SchoolAdminResponse> get admins => _service.adminList;

  // Anggap ini diambil dari Global State/Auth
  final String currentSchoolId = "school-123";

  @override
  void onInit() {
    super.onInit();
    _service.getAll(currentSchoolId);
  }

  Future<void> save(SchoolAdminResponse? admin) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final v = formKey.currentState!.value;
    isLoading.value = true;

    try {
      if (admin == null) {
        // --- CREATE (SEMUA 11 FIELD) ---
        await _service.create(
          CreateSchoolAdminRequest(
            email: v['email'],
            password: v['password'],
            fullName: v['fullName'],
            gender: v['gender'],
            imageUrl: v['imageUrl'],
            schoolId: currentSchoolId, // Field 6
            dob: v['dob'],
            birthPlace: v['birthPlace'],
            nik: v['nik'],
            schoolLevelAccessIds: List<String>.from(
              v['levelAccess'] ?? [],
            ), // Field 10
          ),
        );
      } else {
        // --- UPDATE (FIELD OPTIONAL) ---
        await _service.update(
          admin.id,
          UpdateSchoolAdminRequest(
            email: v['email'],
            password: v["password"],
            fullName: v['fullName'],
            gender: v['gender'],
            imageUrl: v['imageUrl'],
            dob: v['dob'],
            birthPlace: v['birthPlace'],
            nik: v['nik'],
            status: v['status'], // Field 11 (EmployeeStatus)
            schoolLevelAccessIds: List<String>.from(v['levelAccess'] ?? []),
          ),
          currentSchoolId,
        );
      }
      Get.back();
      Get.snackbar("Sukses", "Data Admin berhasil disinkronkan");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteAdmin(String id) => _service.delete(id, currentSchoolId);
}
