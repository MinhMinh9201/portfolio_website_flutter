import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/theme_switcher.dart';
import 'package:portfolio_website/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/presentation/widgets/widget_error_state.dart';
import 'dart:html' as Html;

import 'package:portfolio_website/presentation/widgets/widget_response.dart';

import 'bloc/bloc.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      BlocProvider.of<AboutBloc>(context).add(LoadAbout());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutBloc, AboutState>(builder: (context, state) {
      if (state is AboutLoading) {
        return Center(
          child: WidgetCircleProgress(),
        );
      } else if (state is AboutLoaded) {
        return _buildContent(context: context, state: state);
      } else if (state is AboutWithError) {
        return WidgetErrorState(
          refresh: () async {
            BlocProvider.of<AboutBloc>(context).add(LoadAbout());
          },
        );
      } else {
        return WidgetErrorState(
          refresh: () async {
            BlocProvider.of<AboutBloc>(context).add(LoadAbout());
          },
          message: "Unknow state",
        );
      }
    });
  }

  Widget _buildContent({BuildContext context, AboutLoaded state}) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: WidgetResponse(
              large: Column(
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
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
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
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
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
              small: Column(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: Image.asset(AppImages.imgAvatar).image,
                  ),
                  _buildSpace(),
                  Text(
                    'Minh Minh',
                    textAlign: TextAlign.center,
                    textScaleFactor: 3.0,
                  ),
                  _buildSpace(),
                  Text(
                    'Flutter - Android - IOS \nMusic - Esport - Traving',
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.25,
                  ),
                  _buildSpace(small: false),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
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
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
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
            )),
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
