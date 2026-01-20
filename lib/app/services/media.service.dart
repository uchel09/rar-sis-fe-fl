import 'package:get/get.dart' hide Response;
import 'package:path_provider/path_provider.dart';
import '../providers/base_api_service.dart';

class MediaService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();
  Future<String> downloadPdf(String fileId) async {
    try {
      final url = "https://docs.google.com/uc?export=download&id=$fileId";
      final directory = await getTemporaryDirectory();
      final filePath = "${directory.path}/doc_$fileId.pdf";

      // Pakai Dio untuk download karena lebih stabil buat file besar
      await _api.dio.download(url, filePath);
      return filePath;
    } catch (e) {
      rethrow;
    }
  }
}
