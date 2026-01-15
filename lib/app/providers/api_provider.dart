// api_provider.dart
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'
    as g; // Gunakan alias agar tidak bentrok dengan Dio.Response
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiProvider {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080/api',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            contentType: 'application/json',
          ),
        )
        ..interceptors.add(CookieManager(CookieJar()))
        ..interceptors.add(
          InterceptorsWrapper(
            onError: (DioException e, handler) {
              String errorMessage = "Terjadi kesalahan sistem";

              if (e.response != null) {
                // Cek apakah data dari NestJS berbentuk Map (JSON)
                if (e.response?.data is Map) {
                  errorMessage =
                      e.response?.data['errors']?.toString() ?? errorMessage;
                } else {
                  errorMessage = "Server Error: ${e.response?.statusCode}";
                }
              } else if (e.type == DioExceptionType.connectionTimeout) {
                errorMessage = "Koneksi ke server terputus (Timeout)";
              } else {
                errorMessage =
                    "Gagal terhubung ke server. Pastikan server NestJS menyala.";
              }

              // Tampilkan snackbar hanya jika context tersedia
              if (g.Get.context != null) {
                g.Get.rawSnackbar(
                  title: "Opps!",
                  message: errorMessage,
                  backgroundColor: Colors.redAccent,
                  snackPosition: g.SnackPosition.BOTTOM,
                  margin: const EdgeInsets.all(15),
                  borderRadius: 10,
                );
              }

              return handler.next(e);
            },
          ),
        );
}
