import 'package:get/get.dart' hide Response;
import '../../providers/base_api_service.dart'; // Import dari folder providers
import 'package:get_storage/get_storage.dart';

class SchoolService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();
  final box = GetStorage();
  Future<bool> checkSchoolCode(String code) async {
    final response = await _api.dio.post(
      '/schools/check',
      data: {'code': code},
    );

    // Manual Mapping sederhana
    if (response.statusCode == 201 || response.statusCode == 200) {
      box.write("school_id", response.data["data"]["id"]);
      return true;
    }
    return false;
  }
}
