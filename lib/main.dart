import 'package:flutter/material.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/presentation.dart';
import 'package:portfolio_website/presentation/theme_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initialLightMode: true,
      child: PortfolioWebsite(),
    );
  }
}

class PortfolioWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PortfoliWebsite',
      theme: ThemeSwitcher.of(context).isLightMode
          ? lightTheme(context)
          : darkTheme(context),
      home: HomeScreen(),
    );
  }
}
