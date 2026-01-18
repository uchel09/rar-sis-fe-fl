import 'package:get/get.dart';

class GlobalLoadingController extends GetxController {
  // Shortcut biar manggilnya gampang: GlobalLoadingController.to.show()
  static GlobalLoadingController get to => Get.find();

  final isLoading = false.obs;

  void show() => isLoading.value = true;
  void hide() => isLoading.value = false;
}
