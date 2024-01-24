import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/profile.dart';

class AuthController extends GetxController {
  String? token;
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
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

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

  Future<void> clearAuthData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }
}
