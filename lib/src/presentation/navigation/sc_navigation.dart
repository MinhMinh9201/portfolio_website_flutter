import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/presentation.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_frame.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_input.dart';
import 'package:portfolio_website/src/presentation/widgets/widget_response.dart';
import 'package:portfolio_website/src/utils/utils.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'bloc/bloc.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is NavigationAuthenticated) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routers.navigation, (route) => false);
          });
        } else if (state is NavigationNotAuthenticated) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routers.navigation, (route) => false);
        } else {}
      },
      child: WidgetFrame(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSpace(),
                _buildImage(),
                _buildSpace(),
                _buildSearch(),
                _buildSpaces(),
                _buildOwner(),
                _buildSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOwner() {
    return Column(
      children: [
        WidgetResponse(
          large: Text(
            AppLocalizations.of(context).translate('app.slogan'),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
            textScaleFactor: 1,
          ),
          small: Text(
            AppLocalizations.of(context).translate('app.slogan'),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
            textScaleFactor: 0.9,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        WidgetResponse(
          large: Text(
            AppLocalizations.of(context).translate('app.description'),
            style: Theme.of(context).textTheme.subtitle,
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
          small: Text(
            AppLocalizations.of(context).translate('app.description'),
            style: Theme.of(context).textTheme.subtitle,
            textAlign: TextAlign.center,
            textScaleFactor: 0.9,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            _buildButtonOutline(
                title: AppLocalizations.of(context)
                    .translate('navigation.support_me'),
                action: () {
                  html.window.open("https://www.paypal.com/vn/home", "Support");
                },
                icon: AppImages.icPaypal),
            const SizedBox(
              width: 10,
            ),
            _buildButtonOutline(
                title:
                    AppLocalizations.of(context).translate('navigation.owner'),
                action: () {
                  Navigator.pushNamed(
                      context, Routers.profileOf(name: "@minhminh9201"));
                },
                icon: AppImages.icAvatarMinhMinh),
            const SizedBox(
              width: 10,
            ),
            BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                if (state is NavigationAuthenticated)
                  return _buildButtonOutline(
                      title: AppLocalizations.of(context)
                          .translate('navigation.profile'),
                      action: () {
                        Navigator.pushNamed(
                            context,
                            Routers.profileOf(
                                name:
                                    '${AppUtils.emailToUsername(email: state.user.email)}'));
                      },
                      icon: AppImages.imgAvatarDefault);
                return _buildButtonOutline(
                    title: AppLocalizations.of(context)
                        .translate('navigation.sign_in'),
                    action: () {
                      Navigator.pushNamed(context, Routers.login);
                    },
                    icon: AppImages.icSignUp);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpaces() => WidgetResponse(
        large: const SizedBox(height: 75),
        small: const SizedBox(
          height: 40,
        ),
      );

  Widget _buildSpace() => const SizedBox(
        height: 20,
      );

  Widget _buildImage() {
    return WidgetResponse(
      large: SizedBox(
          height: 125,
          width: 125,
          child: AspectRatio(
              aspectRatio: 1, child: Image.asset(AppImages.imgAvatarDefault))),
      small: SizedBox(
          height: 105,
          width: 105,
          child: AspectRatio(
              aspectRatio: 1, child: Image.asset(AppImages.imgAvatarDefault))),
    );
  }

  Widget _buildSearch() {
    return WidgetResponse(
      large: FractionallySizedBox(
        widthFactor: 0.65,
        child: WidgetInput(
          elevation: 4,
          radiusBorder: 50,
          style: AppStyles.DEFAULT_LARGE,
          inputController: _controller,
          hint:
              AppLocalizations.of(context).translate('navigation.hint_search'),
          height: AppValues.INPUT_FORM_HEIGHT * 1.25,
          endIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ),
      small: FractionallySizedBox(
        widthFactor: 0.8,
        child: WidgetInput(
          elevation: 4,
          radiusBorder: 50,
          style: AppStyles.DEFAULT_MEDIUM,
          inputController: _controller,
          hint:
              AppLocalizations.of(context).translate('navigation.hint_search'),
          height: AppValues.INPUT_FORM_HEIGHT * 1.2,
          endIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _buildButtonOutline({Function action, String icon, String title}) {
    return Container(
      width: 145,
      height: 45,
      child: GestureDetector(
        onTap: action,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.primary, width: 2.5),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$title',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                const SizedBox(width: 4),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircleAvatar(
                    backgroundImage: Image.asset('$icon').image,
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
