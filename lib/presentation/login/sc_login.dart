import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/login/bloc/bloc.dart';
import 'package:portfolio_website/presentation/navigation/bloc/bloc.dart';
import 'package:portfolio_website/presentation/presentation.dart';
import 'package:portfolio_website/presentation/widgets/widget_button.dart';
import 'package:portfolio_website/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/presentation/widgets/widget_frame.dart';
import 'package:portfolio_website/presentation/widgets/widget_input.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio_website/presentation/widgets/widget_response.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      BlocProvider.of<LoginBloc>(context).add(CleanLogin());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          BlocProvider.of<NavigationBloc>(context)
              .add(AuthenticatedNavigation(user: state.user));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return _buildContent(state);
        },
      ),
    );
  }

  Widget _buildContent(state) {
    return WidgetFrame(
      child: Stack(
        children: [
          WidgetResponse(
            large: Center(
              child: FractionallySizedBox(
                widthFactor: .45,
                child: ListView(
                  children: [
                    _buildSpace(),
                    _buildImage(),
                    _buildSpace(small: true),
                    _buildTitle(),
                    _buildSpace(),
                    _buildLoginForm(state),
                    _buildSpace(),
                    _buildRegister(),
                    _buildSpace()
                  ],
                ),
              ),
            ),
            medium: Center(
              child: FractionallySizedBox(
                widthFactor: .65,
                child: ListView(
                  children: [
                    _buildSpace(),
                    _buildImage(),
                    _buildSpace(small: true),
                    _buildTitle(),
                    _buildSpace(),
                    _buildLoginForm(state),
                    _buildSpace(),
                    _buildRegister(),
                    _buildSpace()
                  ],
                ),
              ),
            ),
            small: Center(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: ListView(
                  children: [
                    _buildSpace(),
                    _buildImage(small: true),
                    _buildSpace(small: true),
                    _buildTitle(),
                    _buildSpace(),
                    _buildLoginForm(state),
                    _buildSpace(),
                    _buildRegister(),
                    _buildSpace()
                  ],
                ),
              ),
            ),
          ),
          _buildLoading(state)
        ],
      ),
    );
  }

  Widget _buildRegister() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context).translate('auth.sign_up_description'),
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: 145,
          height: 45,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routers.register);
            },
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
                      AppLocalizations.of(context).translate('auth.sign_up'),
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: CircleAvatar(
                        backgroundImage: Image.asset(AppImages.icSignUp).image,
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSpace({bool small = false}) {
    return small
        ? const SizedBox(
            height: 10,
          )
        : const SizedBox(
            height: 20,
          );
  }

  Widget _buildLoading(LoginState state) {
    if ((state.isSubmitting ?? false) || state.isSuccess ?? false)
      return Container(
        color: Colors.black54,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26), color: Colors.white),
            child: (state.isSuccess ?? false)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WidgetCircleProgress(),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        AppLocalizations.of(context).translate('app.success'),
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontWeight: FontWeight.w800,
                            fontFamily: AppStyles.FONT_SHRIKHAND),
                      )
                    ],
                  )
                : WidgetCircleProgress(),
          ),
        ),
      );
    else
      return SizedBox();
  }

  Widget _buildImage({bool small = false}) {
    return SizedBox(
        height: small ? 85 : 125,
        width: small ? 85 : 125,
        child: AspectRatio(
            aspectRatio: 1, child: Image.asset(AppImages.icFirebase)));
  }

  Widget _buildTitle() {
    return Container(
      child: Center(
        child: Text(
          'LOGIN',
          style: Theme.of(context).textTheme.title.copyWith(
              fontWeight: FontWeight.w800,
              fontFamily: AppStyles.FONT_SHRIKHAND),
        ),
      ),
    );
  }

  Widget _buildLoginForm(LoginState state) {
    return Column(
      children: [
        _buildEmailInput(),
        const SizedBox(
          height: 10,
        ),
        _buildPasswordInput(),
        state.isFailure ?? false
            ? _buildRejected(state.message ?? "...")
            : const SizedBox(
                height: 20,
              ),
        _buildButton(),
      ],
    );
  }

  Widget _buildRejected(String msg) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '$msg',
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.subtitle,
      ),
    );
  }

  Widget _buildButton() {
    return Row(
      children: [
        Expanded(
          child: WidgetButton(
            height: AppValues.INPUT_FORM_HEIGHT * 0.85,
            elevation: 4,
            isEnable: true,
            text: 'Login',
            onTap: () {
              BlocProvider.of<LoginBloc>(context).add(SubmitLogin(
                  password: _passwordController.text.trim(),
                  username: _emailController.text.trim()));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return WidgetInput(
      inputType: TextInputType.emailAddress,
      inputController: _emailController,
      hint: AppLocalizations.of(context).translate('auth.hint_username'),
    );
  }

  Widget _buildPasswordInput() {
    return WidgetInput(
      inputController: _passwordController,
      hint: AppLocalizations.of(context).translate('auth.hint_password'),
      obscureText: obscurePassword,
      endIcon: IconButton(
        icon: Icon(
          obscurePassword
              ? MaterialCommunityIcons.eye_outline
              : MaterialCommunityIcons.eye_off_outline,
          color: AppColors.grey,
        ),
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
      ),
    );
  }
}
