import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final _box = GetStorage();

  // --- GETTERS ---
  bool get isLoggedIn => _box.read('isLoggedIn') ?? false;
  String? get role => _box.read('role');
  String? get schoolCode => _box.read('schoolCode');

  // --- SETTERS ---
  void setAuthData({required String role, required bool status}) {
    _box.write('isLoggedIn', status);
    _box.write('role', role);
  }

  void setSchoolCode(String code) => _box.write('schoolCode', code);

  // --- CLEAR ---
  void clearLoginSession() {
    _box.remove('isLoggedIn');
    _box.remove('role');
    // schoolCode tidak dihapus sesuai permintaan sebelumnya
  }
}
