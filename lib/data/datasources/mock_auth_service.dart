import 'dart:async';

class MockAuthService {
  Future<bool> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Hardcoded credentials for testing
    if (email == 'user@gmail.com' && password == '123456') {
      return true;
    } else {
      return false;
    }
  }
}
