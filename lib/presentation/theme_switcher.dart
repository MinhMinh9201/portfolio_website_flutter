import 'package:flutter/material.dart';

class ThemeSwitcher extends InheritedWidget {
  final _ThemeSwitcherWidgetState data;

  const ThemeSwitcher({Key key, @required this.data, @required Widget child})
      : assert(child != null),
        super(child: child, key: key);

  static _ThemeSwitcherWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeSwitcher)
            as ThemeSwitcher)
        .data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this != oldWidget;
  }
}

class ThemeSwitcherWidget extends StatefulWidget {
  final bool initialLightMode;
  final Widget child;

  const ThemeSwitcherWidget({Key key, this.child, this.initialLightMode})
      : assert(initialLightMode != null),
        assert(child != null),
        super(key: key);
  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  bool isLightMode;
  void switchMode() {
    setState(() {
      isLightMode = !isLightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    isLightMode = isLightMode ?? widget.initialLightMode;
    return ThemeSwitcher(
      data: this,
      child: widget.child,
    );
  }
}
