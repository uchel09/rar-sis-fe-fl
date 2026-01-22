import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SchoolController extends GetxController {
  final box = GetStorage();

  static const _key = 'school_code';

  /// runtime config (dotenv versi user)
  final RxnString schoolCode = RxnString();

  @override
  void onInit() {
    schoolCode.value = box.read(_key);
    super.onInit();
  }

  bool get hasSchool => schoolCode.value != null;

  void saveSchoolCode(String code) {
    schoolCode.value = code;
    box.write(_key, code);
    // box.write(_key2, id);
  }

  void clear() {
    schoolCode.value = null;
    box.remove(_key);
  }
}
