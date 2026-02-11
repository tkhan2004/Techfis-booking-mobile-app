import 'package:hotel_booking/data/datasources/mock_auth_service.dart';

class AuthRepository {
  final MockAuthService _authService;

  AuthRepository(this._authService);

  Future<bool> login(String email, String password) async {
    return await _authService.login(email, password);
  }
}
