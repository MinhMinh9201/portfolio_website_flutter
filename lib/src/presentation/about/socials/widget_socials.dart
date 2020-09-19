import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/about/bloc/about_bloc.dart';
import 'package:portfolio_website/src/presentation/widgets/widgets.dart';
import 'package:portfolio_website/src/resource/model/model.dart';
import 'package:portfolio_website/src/utils/app_utils.dart';

import 'bloc/bloc.dart';

class WidgetSocialEditAbout extends StatelessWidget {
  final Color grey = AppColors.grey;
  final Color black45 = Colors.black45;
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
      margin: const EdgeInsets.all(45),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Stack(
        children: [
          BlocListener<SocialBloc, SocialState>(
            listener: (context, state) {
              if (state is SocialSaving) {
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
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
                } else if (state is SocialSaving) {
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
          _buildClose(context, top: -15, right: -15)
        ],
      ),
    );
  }

  Widget _buildContent(String urls, BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
              style: AppStyles.DEFAULT_SMALL.copyWith(color: black45),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildWrapAutomate(urls, context),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  _buildWrapAutomate(String urls, BuildContext context) {
    return WidgetWrapAutomate<UrlSocialModel>(
        data: AppUtils.parseURL(urls), widgetChild: widgetChild);
  }

  Widget widgetChild(data, action) {
    return _buildInput(Get.context);
  }

  _buildInput(BuildContext context) {
    return WidgetInput(
      height: 46,
      paddingHorizontal: 12,
      width: 180,
      radiusBorder: 16,
      paddingLeftMore: 12,
      textAlign: TextAlign.center,
      style: AppStyles.DEFAULT_MEDIUM_BOLD,
      hint: AppLocalizations.of(context).translate('about.hint_social'),
    );
  }

  Widget _buildClose(BuildContext context, {double top = 0, double right = 0}) {
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
