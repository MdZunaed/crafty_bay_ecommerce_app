import 'dart:convert';

import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/profile.dart';

class AuthController extends GetxController {
  static String? token;
  Profile? profile;
  Future<void> saveUserDetails(String t, Profile p) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('token', t);
    await sp.setString('profile', jsonEncode(p.toJson()));
    token = t;
    profile = p;
  }

  Future<void> initialize() async {
    token = await _getToken();
    profile = await _getProfile();
    print(token);
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  bool get isTokenNotNull => token != null;

  Future<String?> _getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('token');
  }

  Future<Profile?> _getProfile() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? profile = sp.getString('profile');
    if (profile == null) {
      return null;
    } else {
      return Profile.fromJson(jsonDecode(profile));
    }
  }

  static Future<void> clearAuthData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
    token == null;
  }

  static Future<void> goToLogin() async {
    Get.to(() => const VerifyEmailScreen());
  }
}
