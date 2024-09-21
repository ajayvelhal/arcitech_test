import 'package:arcitech_new/models/auth_response.dart';
import 'package:arcitech_new/utils/constants.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio = Dio();

  Future<AuthResponse> signUpAndLogin(Map<String, dynamic> requestBody) async {
    AuthResponse authResponse = AuthResponse();
    try {
      dio.options.baseUrl = AppConstants.kBaseUrl;
      print(dio.options.baseUrl);
      print(dio.options);
      final resp =
          await dio.post(AppConstants.signUpAndLogin, data: requestBody);
      print(resp);
      authResponse = AuthResponse.fromJson(resp.data);
    } catch (e) {
      authResponse.status = 500;
      authResponse.message = e.toString();
    }
    return authResponse;
  }
}
