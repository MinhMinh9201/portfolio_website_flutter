import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/presentation/widgets/widget_error_state.dart';
import 'dart:html' as Html;

import 'package:portfolio_website/presentation/widgets/widget_response.dart';
import 'package:portfolio_website/resource/resource.dart';
import 'package:portfolio_website/utils/app_utils.dart';

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
      String routeName = ModalRoute.of(context).settings.name;
      String username = routeName.substring(routeName.indexOf('@'));
      BlocProvider.of<AboutBloc>(context).add(LoadAbout(username: username));
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
    Profile profile = state?.profile;
    List<Widget> socialButtons = [];
    AppUtils.parseURL(profile.urls).forEach((element) {
      socialButtons.add(_buildFlatButtonURL(model: element));
    });
    return SingleChildScrollView(
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: WidgetResponse(
              large: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: profile.image,
                    imageBuilder: (context, image) => CircleAvatar(
                      radius: 100,
                      backgroundImage: image,
                    ),
                    placeholder: (context, url) => SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(child: WidgetCircleProgress()),
                    ),
                    errorWidget: (context, error, url) => CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          Image.asset(AppImages.imgAvatarDefault).image,
                    ),
                  ),
                  _buildSpace(),
                  Text(
                    profile?.name ?? "",
                    textScaleFactor: 3.5,
                  ),
                  _buildSpace(),
                  Text(
                    AppUtils.parseDescription(profile?.description),
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                  ),
                  _buildSpace(small: false),
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
                        .getRange((socialButtons.length / 2).floor(),
                            socialButtons.length)
                        .toList(),
                  )
                ],
              ),
              small: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: profile.image,
                    imageBuilder: (context, image) => CircleAvatar(
                      radius: 90,
                      backgroundImage: image,
                    ),
                    placeholder: (context, url) => SizedBox(
                      height: 90,
                      width: 90,
                      child: Center(child: WidgetCircleProgress()),
                    ),
                    errorWidget: (context, error, url) => CircleAvatar(
                      radius: 90,
                      backgroundImage:
                          Image.asset(AppImages.imgAvatarDefault).image,
                    ),
                  ),
                  _buildSpace(),
                  Text(
                    profile?.name ?? "",
                    textScaleFactor: 3.0,
                  ),
                  _buildSpace(),
                  Text(
                    AppUtils.parseDescription(profile?.description),
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.25,
                  ),
                  _buildSpace(small: false),
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
                        .getRange((socialButtons.length / 2).floor(),
                            socialButtons.length)
                        .toList(),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildFlatButtonURL({UrlSocialModel model}) {
    return FlatButton.icon(
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
