import 'dart:convert';
import 'package:flutter/material.dart';
import '../storage/local_storage.dart';

class SessionController {
  final LocalStorage sharedPreferenceClass = LocalStorage();
  static final SessionController _session = SessionController._internal();

  // Simple session variables
  static bool? isLogin;
  static String? userToken;
  static Map<String, dynamic>? userData;

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }

  /// Saves raw user data and login state
  Future<void> saveUserInPreference(dynamic data) async {
    // Save as JSON string if it's a Map, otherwise save as String
    String valueToSave = data is Map ? jsonEncode(data) : data.toString();
    
    await sharedPreferenceClass.setValue('token', valueToSave);
    await sharedPreferenceClass.setValue('isLogin', 'true');
    
    isLogin = true;
    userToken = valueToSave;
  }

  /// Retrieves session status from storage
  Future<void> getUserFromPreference() async {
    try {
      userToken = await sharedPreferenceClass.readValue('token');
      String? loginStatus = await sharedPreferenceClass.readValue('isLogin');

      isLogin = loginStatus == 'true';
      
      if (userToken != null && userToken!.startsWith('{')) {
        userData = jsonDecode(userToken!);
      }
    } catch (e) {
      debugPrint("Session Error: $e");
      isLogin = false;
    }
  }

  Future<void> logout() async {
    await sharedPreferenceClass.clearValue('token');
    await sharedPreferenceClass.setValue('isLogin', 'false');
    
    isLogin = false;
    userToken = null;
    userData = null;
  }
}