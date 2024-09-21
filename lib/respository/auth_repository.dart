import 'package:arcitech_new/services/auth_service.dart';

import '../models/auth_response.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<AuthResponse> signUpAndLogin(Map<String, dynamic> requestBody) =>
      _authService.signUpAndLogin(requestBody);
}
