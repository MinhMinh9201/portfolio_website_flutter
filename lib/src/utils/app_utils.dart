import 'dart:convert';

import 'package:portfolio_website/src/resource/database/app_database.dart';
import 'package:portfolio_website/src/resource/model/model.dart';

class AppUtils {
  AppUtils._();

  static Map<String, dynamic> mapData(Map<String, dynamic> data) {
    return {"data": data ?? {}};
  }

  static Map<String, dynamic> parseData(Map<String, dynamic> data) {
    return data['data'] ?? {};
  }

  static String emailToUsername({String email}) {
    if (email == null) return "";
    String username = "@${email.substring(0, email.indexOf("@"))}";
    return username;
  }

  //Demo: "Flutter,Android,IOS,Music,Esport,Traving"
  static String parseDescriptionToString(String data) {
    if (data == null) return "";
    List<String> strings = data.split(',').toList();
    String description = '';
    for (int i = 0; i < strings.length; i++) {
      if (i == (strings.length / 2).floor()) {
        description += "${strings[i]}\n";
      } else if (i < strings.length - 1)
        description += "${strings[i]} - ";
      else
        description += "${strings[i]}";
    }
    return description;
  }

  static List<String> parseDescriptionToList(String data) {
    if (data == null) return [];
    List<String> strings = data.split(',').toList();
    return strings;
  }

  //Demo: "{ "url": "https://github.com/MinhMinh9201", "icon": "assets/images/github.png",  "name": "Github", "description": "","isFromFirebase": 0}||
  //{ "url": "https://www.facebook.com/minh9201", "icon": "assets/images/facebook.png",  "name": "Facebook", "description": "","isFromFirebase": 0}"
  static List<UrlSocialModel> parseURL(String data) {
    if (data == null) return [];
    List<UrlSocialModel> socials;
    try {
      List<String> list = data.split("||");
      socials = list.map((e) {
        return UrlSocialModel.fromJson(jsonDecode(e) as Map);
      }).toList();
    } catch (e) {
      print(e);
      socials = [];
    }
    return socials;
  }
}
