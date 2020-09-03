import 'package:flutter/material.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/theme_switcher.dart';
import 'dart:html' as Html;

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: Image.asset(AppImages.imgAvatar).image,
              ),
              _buildSpace(),
              Text(
                'Minh Minh',
                textScaleFactor: 3.5,
              ),
              _buildSpace(),
              Text(
                'Flutter - Android - IOS \nMusic - Esport - Traving',
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.center,
                textScaleFactor: 1.5,
              ),
              _buildSpace(small: false),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildFlatButton(
                      label: "Github",
                      icon: AppImages.icGithub,
                      url: AppValues.URL_GITHUB),
                  _buildFlatButton(
                      label: "Medium",
                      icon: ThemeSwitcher.of(context).isLightMode
                          ? AppImages.icMediumLight
                          : AppImages.icMedium,
                      url: AppValues.URL_MEDIUM),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildFlatButton(
                      label: "Instagram",
                      icon: AppImages.icInstagram,
                      url: AppValues.URL_INSTAGRAM),
                  _buildFlatButton(
                      label: 'Facebook',
                      icon: AppImages.icFB,
                      url: AppValues.URL_FB),
                  _buildFlatButton(
                      label: 'LinkedIn',
                      icon: AppImages.icLinkedIn,
                      url: AppValues.URL_LINKEDIN)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlatButton({String url, String label, String icon}) {
    return FlatButton.icon(
        onPressed: () {
          Html.window.open("$url", 'Minh Minh - Portfolio website');
        },
        icon: SizedBox(
          width: 20,
          height: 20,
          child: Image.asset(icon),
        ),
        label: Text(label));
  }

  Widget _buildSpace({bool small = true}) {
    return small
        ? const SizedBox(
            height: 20,
            width: 20,
          )
        : const SizedBox(
            height: 35,
            width: 35,
          );
  }
}
