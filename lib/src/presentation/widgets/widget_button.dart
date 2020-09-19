import 'package:flutter/material.dart';
import 'package:portfolio_website/src/configs/configs.dart';

class WidgetButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final bool isEnable;
  final Widget child;
  final double height;
  final double elevation;
  final double radiusBorder;

  const WidgetButton(
      {Key key,
      this.onTap,
      this.text,
      this.isEnable,
      this.child,
      this.elevation,
      this.height,
      this.radiusBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? AppValues.INPUT_FORM_HEIGHT,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: elevation ?? 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusBorder ?? 20)),
          color: isEnable ? AppColors.enableButton : AppColors.disableButton,
          child: Center(
              child: child ??
                  Text(
                    text ?? "",
                    style: isEnable
                        ? AppStyles.DEFAULT_MEDIUM_BOLD
                            .copyWith(color: Colors.white)
                        : AppStyles.DEFAULT_MEDIUM_BOLD
                            .copyWith(color: AppColors.grey),
                  )),
        ),
      ),
    );
  }
}
