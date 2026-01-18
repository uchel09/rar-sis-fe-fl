// lib/app/data/services/base_api_service.dart
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

class BaseApiService extends g.GetxService {
  late Dio dio;
  final cookieJar = CookieJar();
  final box = GetStorage();
  bool _isDialogShowing = false;
  Future<BaseApiService> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080/api',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(
      InterceptorsWrapper(
        // Untuk cek cookie atau debug cookie =>
        // onResponse: (response, handler) async {
        //   // PRINT DISINI BOS
        //   final cookies = await cookieJar.loadForRequest(
        //     Uri.parse(dio.options.baseUrl),
        //   );
        //   print("======= DEBUG COOKIE START =======");
        //   print("Path: ${response.requestOptions.path}");
        //   print("Cookies in Jar: $cookies");
        //   print("======= DEBUG COOKIE END =======");

        //   return handler.next(response);
        // },
        onError: (DioException e, handler) {
          String errorMessage = "Terjadi kesalahan sistem";
          final bool isLoginPath = e.requestOptions.path.contains(
            '/auth/login',
          );
          if (e.response != null) {
            if (e.response?.statusCode == 401 && !isLoginPath) {
              if (!_isDialogShowing) {
                _isDialogShowing = true;

                g.Get.dialog(
                  AlertDialog(
                    title: const Text("Sesi Berakhir"),
                    content: const Text(
                      "Sesi Anda telah berakhir, Silakan login kembali.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          _isDialogShowing = false;
                          // Langsung tendang ke Login
                          // 1. Clear Cookies
                          box.remove('isLoggedIn');
                          box.remove('role');
                          await cookieJar.deleteAll();

                          // 2. Clear Storage (isLoggedIn & role) lewat StorageService
                          // Supaya Middleware nendang user keluar secara permanen
                          g.Get.offAllNamed('/login');
                        },
                        child: const Text("Kembali ke Login"),
                      ),
                    ],
                  ),
                  barrierDismissible: false,
                );
              }
            } else if (e.response?.data is Map) {
              // Menangkap error konsisten dari NestJS
              errorMessage =
                  e.response?.data['errors']?.toString() ?? errorMessage;
            } else {
              errorMessage = "Server Error: ${e.response?.statusCode}";
            }
          } else if (e.type == DioExceptionType.connectionTimeout) {
            errorMessage = "Koneksi ke server terputus (Timeout)";
          } else {
            return handler.next(e);
          }

          if (g.Get.context != null) {
            g.Get.rawSnackbar(
              title: "Opps!",
              message: errorMessage,
              backgroundColor: Colors.redAccent,
              snackPosition: g.SnackPosition.TOP,
              margin: const EdgeInsets.all(15),
              borderRadius: 10,
            );
          }
          return handler.next(e);
        },
      ),
    );
    return this;
  }
}
