class AppUtils {
  AppUtils._();

  static String emailToUsername({String email}) {
    if (email == null) return "";
    String username = "@${email.substring(0, email.indexOf("@"))}";
    return username;
  }
}
