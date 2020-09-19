import 'dart:async';
import 'dart:convert';

import 'package:portfolio_website/src/resource/database/app_database.dart';
import 'package:portfolio_website/src/utils/utils.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  AppShared._();
  static final prefs = RxSharedPreferences(SharedPreferences.getInstance());

  static String _localAuthCode = "///";
  static String _keyLocalAuth = "_keyLocalAuth";
  static String _keyUserProfile = "_keyUserProfile";

  static Future<bool> setLocalAuth({String password, String email}) async =>
      prefs.setString(_keyLocalAuth, '$email$_localAuthCode$password');

  static Future<Map<String, String>> getLocalAuth() async {
    String data = await prefs.getString(_keyLocalAuth);
    if (data == null || data.length == 0) return null;
    String email = data.split(_localAuthCode)[0];
    String password = data.split(_localAuthCode)[1];
    return {"email": email, "password": password};
  }

  static Future<bool> setUserProfile(Profile profile) async =>
      prefs.setString(_keyUserProfile, jsonEncode(profile));

  static Future<Profile> getUserProfile() async {
    String profile = await prefs.getString(_keyUserProfile);
    if (profile == null || profile.length == 0) return null;
    return Profile.fromJson(jsonDecode(profile));
  }

  static Stream<Profile> watchUserProfile() {
    return prefs.getStringStream(_keyUserProfile).transform(
        StreamTransformer.fromHandlers(
            handleData: (data, sink) => data == null || data.length == 0
                ? sink.add(null)
                : sink.add(Profile.fromJson(jsonDecode(data)))));
  }
}
