import 'package:flutter/material.dart';
import 'package:portfolio_website/presentation/presentation.dart';
import 'package:portfolio_website/presentation/widgets/widget_error_state.dart';

class Routers {
  static const String navigation = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String profile = '/profile';
  static String profileOf({String name}) => '/profile/$name';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case navigation:
        return animRoute(NavigationScreen(), name: navigation);
        break;
      case login:
        return animRoute(LoginScreen(), name: login);
        break;
      case register:
        return animRoute(RegisterScreen(), name: register);
        break;
      default:
        if (settings.name.startsWith("$profile/@"))
          return animRoute(ProfileScreen(), name: settings.name);
        return animRoute(WidgetErrorState(
          message: 'No route defined for ${settings.name}',
        ));
    }
  }

  static Route animRoute(Widget page,
      {Offset beginOffset, String name, Object arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = beginOffset ?? Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Offset center = Offset(0.0, 0.0);
  static Offset top = Offset(0.0, 1.0);
  static Offset bottom = Offset(0.0, -1.0);
  static Offset left = Offset(-1.0, 0.0);
  static Offset right = Offset(1.0, 0.0);
}
