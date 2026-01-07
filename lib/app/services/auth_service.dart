import 'package:dio/dio.dart';
import '../providers/api_provider.dart';

class AuthService {
  static Future<Response> login({
    required String email,
    required String password,
  }) {
    return ApiProvider.dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
  }
}
