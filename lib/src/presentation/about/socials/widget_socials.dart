import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/about/bloc/about_bloc.dart';
import 'package:portfolio_website/src/presentation/about/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/about/socials/widget_social_item.dart';
import 'package:portfolio_website/src/presentation/widgets/widgets.dart';
import 'package:portfolio_website/src/resource/model/model.dart';
import 'package:portfolio_website/src/utils/app_utils.dart';
import 'package:toast/toast.dart';

import '../../presentation.dart';
import 'bloc/bloc.dart';

class WidgetSocialEditAbout extends StatelessWidget {
  final Color grey = AppColors.grey;
  final Color black45 = Colors.black45;
  Map<String, dynamic> result = {};
  final String username;

  WidgetSocialEditAbout({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    BlocProvider.of<SocialBloc>(context)
        .add(InitializeSocial(aboutBloc: BlocProvider.of<AboutBloc>(context)));

    return Container(
      margin: const EdgeInsets.all(65),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ThemeSwitcher.of(context).isLightMode
              ? Colors.white
              : Colors.white24),
      child: Stack(
        children: [
          BlocListener<AboutBloc, AboutState>(
            listener: (context, state) {
              if (state is AboutEditSuccess) {
                BlocProvider.of<SocialBloc>(context).add(SavedSocial());
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              } else if (state is AboutEditFailure) {
                Toast.show(state.message, context);
              }
            },
            child: BlocBuilder<SocialBloc, SocialState>(
              builder: (context, state) {
                if (state is SocialLoading) {
                  return Center(
                    child: WidgetCircleProgress(),
                  );
                } else if (state is SocialInitialized) {
                  return _buildContent(state.urls, context);
                } else if (state is SocialSaved) {
                  return WidgetErrorState(message: "Saved");
                } else {
                  return WidgetErrorState(
                    message: "Unknow state",
                    refresh: () async {
                      BlocProvider.of<SocialBloc>(context).add(InitializeSocial(
                          aboutBloc: BlocProvider.of<AboutBloc>(context)));
                    },
                  );
                }
              },
            ),
          ),
          _buildClose(context)
        ],
      ),
    );
  }

  Widget _buildContent(String urls, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              child: Text(
                AppLocalizations.of(context).translate('about.social.title'),
                style: AppStyles.DEFAULT_MEDIUM_BOLD,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              child: Text(
                AppLocalizations.of(context).translate('about.social.help'),
                style: AppStyles.DEFAULT_SMALL,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildWrapAutomate(urls, context),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('about.save'),
                        style: AppStyles.DEFAULT_SMALL,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(Icons.save),
                    ],
                  ),
                  onPressed: () {
                    print('-----|${result[WidgetWrapAutomate.keyData]}');
                    BlocProvider.of<SocialBloc>(context).add(SaveSocial(
                        username: username,
                        aboutBloc: BlocProvider.of<AboutBloc>(context),
                        urls: result[WidgetWrapAutomate.keyData]));
                  }),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  _buildWrapAutomate(String urls, BuildContext context) {
    return WidgetWrapAutomate<UrlSocialModel>(
        result: result,
        data: AppUtils.parseURL(urls),
        widgetChild: widgetChild);
  }

  Widget widgetChild(data, action) {
    return _buildInput(Get.context, data, action);
  }

  _buildInput(BuildContext context, UrlSocialModel data, Function onChanged) {
    return WidgetSocialItem(
      data: data,
      onChanged: onChanged,
    );
  }

  Widget _buildClose(BuildContext context,
      {double top = -10, double right = -20}) {
    return Positioned(
      top: top,
      right: right,
      child: FlatButton(
          shape: CircleBorder(),
          padding: EdgeInsets.all(8),
          child: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
