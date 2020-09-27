import 'dart:convert';
import 'package:portfolio_website/src/resource/model/model.dart';

class AppUtils {
  AppUtils._();

  static Map<String, dynamic> mapData(Map<String, dynamic> data) {
    return {"data": data ?? {}};
  }

  static Map<String, dynamic> parseData(Map<String, dynamic> data) {
    return data['data'] ?? {};
  }

  static Map<String, dynamic> parseDataWithID(
      Map<String, dynamic> data, String id) {
    Map<String, dynamic> temp = data['data'] ?? {};
    temp['id'] = id;
    return temp;
  }

  static String emailToUsername({String email}) {
    if (email == null) return "";
    String username = "@${email.substring(0, email.indexOf("@"))}";
    return username;
  }

  //Just gmail
  static String usernameToEmail({String username}) {
    if (username == null) return null;
    return '${username.substring(1)}@gmail.com';
  }

  //Demo: "Flutter,Android,IOS,Music,Esport,Traving"
  static String parseDescriptionToString(String data) {
    if (data == null) return "";
    List<String> strings = data.split(',').toList();
    strings.removeWhere(
        (element) => element == null || element.trim().length == 0);
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

  static String listToDescription(List<String> data) {
    String description = '';
    if (data == null || data.length == 0) return description;
    for (int i = 0; i < data.length; i++) {
      if (data[i] != null && data[i].trim().length != 0) {
        if (i == data.length - 1)
          description += "${data[i]}";
        else
          description += "${data[i]},";
      }
    }
    print('------|$description');
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
      list.removeWhere((element) => element == null || element.length == 0);
      socials = list.map((e) {
        return UrlSocialModel.fromJson(jsonDecode(e) as Map);
      }).toList();
    } catch (e) {
      print(e);
      socials = [];
    }
    return socials;
  }

  static String mapURL(List<UrlSocialModel> data) {
    if (data == null || data.length == 0) return "";
    String urls = "";
    for (int i = 0; i < data.length; i++) {
      if (data[i] != null && data[i].name != null && data[i].name.length != 0) {
        if (i < data.length - 1)
          urls += '${data[i].toString()}||';
        else
          urls += '${data[i].toString()}';
      }
    }
    return urls;
  }
}
