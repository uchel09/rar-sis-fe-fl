import 'package:get/get.dart' hide Response;
import '../../providers/base_api_service.dart'; // Import dari folder providers

class SchoolService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  Future<bool> checkSchoolCode(String code) async {
    final response = await _api.dio.post(
      '/schools/check',
      data: {'code': code},
    );

    // Manual Mapping sederhana
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
