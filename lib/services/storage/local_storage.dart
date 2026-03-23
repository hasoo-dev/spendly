 import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  // Standard Keys for a professional app
  static const String keyToken = "auth_token";
  static const String keyIsFirstTime = "is_first_time";
  static const String keyIsLoggedIn = "is_logged_in";

  Future<void> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readValue(String key) async {
    return await storage.read(key: key);
  }

  Future<void> clearValue(String key) async {
    await storage.delete(key: key);
  }

  // Professional addition: Clear everything on Logout
  Future<void> logout() async {
    await storage.delete(key: keyToken);
    await storage.write(key: keyIsLoggedIn, value: 'false');
  }
}