import 'dart:async';

class MockAuthService {
  Future<bool> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Hardcoded credentials for testing
    if (email == 'user@example.com' && password == 'password123') {
      return true;
    } else {
      return false;
    }
  }
}
