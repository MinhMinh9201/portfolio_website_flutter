import 'package:flutter/material.dart';
import 'package:portfolio_website/configs/configs.dart';

class WidgetButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final isEnable;

  const WidgetButton({Key key, this.onTap, this.text, this.isEnable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppValues.INPUT_FORM_HEIGHT,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: isEnable ? AppColors.enableButton : AppColors.disableButton,
          child: Center(
              child: Text(
            text,
            style: isEnable
                ? AppStyles.DEFAULT_MEDIUM.copyWith(color: Colors.white)
                : AppStyles.DEFAULT_MEDIUM.copyWith(color: AppColors.grey),
          )),
        ),
      ),
    );
  }
}
