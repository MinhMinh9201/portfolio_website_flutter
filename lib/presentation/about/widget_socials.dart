import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/resource/resource.dart';
import 'package:portfolio_website/utils/utils.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as Html;

class WidgetSocialsAbout extends StatelessWidget {
  final String urls;
  const WidgetSocialsAbout({this.urls});
  @override
  Widget build(BuildContext context) {
    List<Widget> socialButtons = [];
    AppUtils.parseURL(urls).forEach((element) {
      socialButtons.add(_buildFlatButtonURL(model: element));
    });
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: socialButtons
              .getRange(0, (socialButtons.length / 2).floor())
              .toList(),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: socialButtons
              .getRange(
                  (socialButtons.length / 2).floor(), socialButtons.length)
              .toList(),
        )
      ],
    );
  }

  Widget _buildFlatButtonURL({UrlSocialModel model}) {
    return FlatButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onPressed: () {
          Html.window.open("${model.url}", 'Minh Minh - Portfolio website');
        },
        icon: SizedBox(
          width: 20,
          height: 20,
          child: model.isFromFirebase == 0
              ? Image.asset(model.icon)
              : CachedNetworkImage(
                  imageUrl: model.icon,
                  fit: BoxFit.fill,
                ),
        ),
        label: Text(model.name ?? ""));
  }
}
