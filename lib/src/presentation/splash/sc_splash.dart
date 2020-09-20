import 'package:flutter/material.dart';

import '../presentation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void modelByTime() {
    DateTime time = DateTime.now();
    if (time.hour < 6 && time.hour > 18) {
      ThemeSwitcher.of(context).switchMode();
    }
  }

  void goToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    modelByTime();
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new NavigationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getCurrentBackground(),
      fit: BoxFit.fill,
    );
  }

  static String getCurrentBackground() {
    DateTime time = DateTime.now();
    String uri;
    switch (time.hour) {
      case 1:
        uri = 'assets/backgrounds/morning1.png';
        break;
      case 2:
        uri = 'assets/backgrounds/morning1.png';
        break;
      case 3:
        uri = 'assets/backgrounds/morning2.png';
        break;
      case 4:
        uri = 'assets/backgrounds/morning2.png';
        break;
      case 5:
        uri = 'assets/backgrounds/morning3.png';
        break;
      case 6:
        uri = 'assets/backgrounds/morning3.png';
        break;
      case 7:
        uri = 'assets/backgrounds/day4.png';
        break;
      case 8:
        uri = 'assets/backgrounds/day4.png';
        break;
      case 9:
        uri = 'assets/backgrounds/day5.png';
        break;
      case 10:
        uri = 'assets/backgrounds/day5.png';
        break;
      case 11:
        uri = 'assets/backgrounds/day6.png';
        break;
      case 12:
        uri = 'assets/backgrounds/day6.png';
        break;
      case 13:
        uri = 'assets/backgrounds/evening7.png';
        break;
      case 14:
        uri = 'assets/backgrounds/evening7.png';
        break;
      case 15:
        uri = 'assets/backgrounds/evening8.png';
        break;
      case 16:
        uri = 'assets/backgrounds/evening8.png';
        break;
      case 17:
        uri = 'assets/backgrounds/evening9.png';
        break;
      case 18:
        uri = 'assets/backgrounds/evening9.png';
        break;
      case 19:
        uri = 'assets/backgrounds/night10.png';
        break;
      case 20:
        uri = 'assets/backgrounds/night10.png';
        break;
      case 21:
        uri = 'assets/backgrounds/night11.png';
        break;
      case 22:
        uri = 'assets/backgrounds/night11.png';
        break;
      case 23:
        uri = 'assets/backgrounds/night12.png';
        break;
      case 24:
        uri = 'assets/backgrounds/night12.png';
        break;
      default:
        uri = 'assets/backgrounds/morning3.png';
        break;
    }
    print('------|Background: $uri|--------');
    return uri;
  }
}
