import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/auth/bloc/auth_bloc.dart';
import 'package:portfolio_website/presentation/auth/bloc/auth_state.dart';
import 'package:portfolio_website/presentation/widgets/widget_button.dart';
import 'package:portfolio_website/presentation/widgets/widget_input.dart';
import 'package:portfolio_website/presentation/widgets/widget_response.dart';

import '../theme_switcher.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSpace(),
              _buildImage(),
              _buildSpace(),
              _buildSearch(),
              _buildSpace(),
              _buildSpace(),
              _buildSpace(),
              _buildSpace(),
              _buildOwner(),
              _buildSpace(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOwner() {
    return Column(
      children: [
        Text(
          AppStrings.slogan,
          style: Theme.of(context).textTheme.title,
        ),
        Text(
          AppStrings.description,
          style: Theme.of(context).textTheme.subtitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButtonOutline(
                title: 'Support Me', action: () {}, icon: AppImages.icPaypal),
            const SizedBox(
              width: 10,
            ),
            _buildButtonOutline(
                title: 'Minh Minh',
                action: () {},
                icon: AppImages.icAvatarMinhMinh),
            const SizedBox(
              width: 10,
            ),
            _buildButtonOutline(
                title: 'SignUp', action: () {}, icon: AppImages.icSignUp),
          ],
        ),
      ],
    );
  }

  Widget _buildSpace() => const SizedBox(
        height: 20,
      );

  Widget _buildImage() {
    return WidgetResponse(
      large: SizedBox(
          height: 125,
          width: 125,
          child: AspectRatio(
              aspectRatio: 1, child: Image.asset(AppImages.icFirebase))),
      small: SizedBox(
          height: 105,
          width: 105,
          child: AspectRatio(
              aspectRatio: 1, child: Image.asset(AppImages.icFirebase))),
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
          hint: AppStrings.hintSearch,
          height: AppValues.INPUT_FORM_HEIGHT * 1.25,
          endIcon: IconButton(
            icon: Icon(Icons.search_rounded),
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
          hint: AppStrings.hintSearch,
          height: AppValues.INPUT_FORM_HEIGHT * 1.25,
          endIcon: IconButton(
            icon: Icon(Icons.search_rounded),
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

  Widget _buildAppBar() => AppBar(
        actions: [
          IconButton(
              icon: ThemeSwitcher.of(context).isLightMode
                  ? Image.asset(
                      AppImages.icMoon,
                      height: 20,
                      width: 20,
                    )
                  : Icon(Icons.wb_sunny),
              onPressed: () => ThemeSwitcher.of(context).switchMode())
        ],
      );
}
