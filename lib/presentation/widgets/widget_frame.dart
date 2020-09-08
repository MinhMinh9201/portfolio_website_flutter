import 'package:flutter/material.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/presentation.dart';

class WidgetFrame extends StatelessWidget {
  final Widget child;
  final GlobalKey<ScaffoldState> key;
  const WidgetFrame({this.child, this.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: _buildAppbar(context),
      body: child,
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            icon: ThemeSwitcher.of(context).isLightMode
                ? Image.asset(
                    AppImages.icMoon,
                    height: 20,
                    width: 20,
                  )
                : Icon(Icons.wb_sunny),
            onPressed: () => ThemeSwitcher.of(context).switchMode())
      ],
    );
  }
}
