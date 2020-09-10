import 'package:portfolio_website/resource/database/app_database.dart';

class AppUtils {
  AppUtils._();

  static String emailToUsername({String email}) {
    if (email == null) return "";
    String username = "@${email.substring(0, email.indexOf("@"))}";
    return username;
  }

  static Map<String, dynamic> mapData(Map<String, dynamic> data) {
    return {"data": data ?? {}};
  }

  static Map<String, dynamic> parseData(Map<String, dynamic> data) {
    return data['data'] ?? {};
  }
}
