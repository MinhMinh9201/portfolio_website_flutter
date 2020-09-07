import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/auth/bloc/bloc.dart';
import 'package:portfolio_website/presentation/widgets/widget_button.dart';
import 'package:portfolio_website/presentation/widgets/widget_circle_progress.dart';
import 'package:portfolio_website/presentation/widgets/widget_input.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return _buildContent(state);
      },
    );
  }

  Widget _buildContent(state) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: Colors.white,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: .45,
                  child: ListView(
                    children: [
                      _buildSpace(),
                      _buildImage(),
                      _buildSpace(),
                      _buildLoginForm(),
                      _buildSpace(),
                    ],
                  ),
                ),
              )),
          _buildLoading(state)
        ],
      ),
    );
  }

  Widget _buildSpace() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _buildLoading(AuthState state) {
    if (state.isSubmitting)
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
          child: WidgetCircleProgress(),
        ),
      );
    else
      return SizedBox();
  }

  Widget _buildImage() {
    return SizedBox(
        height: 85,
        width: 85,
        child: AspectRatio(
            aspectRatio: 1, child: Image.asset(AppImages.icFirebase)));
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        _buildEmailInput(),
        const SizedBox(
          height: 10,
        ),
        _buildPasswordInput(),
        const SizedBox(
          height: 20,
        ),
        _buildButton(),
      ],
    );
  }

  Widget _buildButton() {
    return Row(
      children: [
        Expanded(
          child: WidgetButton(
            isEnable: true,
            text: 'Login',
            onTap: () {
              BlocProvider.of<AuthBloc>(context).add(SubmitLoginAuth(
                  password: _passwordController.text,
                  username: _emailController.text));
            },
          ),
        ),
        Expanded(
          child: WidgetButton(
            isEnable: true,
            text: 'Register',
            onTap: () {
              BlocProvider.of<AuthBloc>(context).add(SubmitRegisterAuth(
                  password: _passwordController.text,
                  username: _emailController.text));
            },
          ),
        )
      ],
    );
  }

  Widget _buildEmailInput() {
    return WidgetInput(
      inputType: TextInputType.emailAddress,
      inputController: _emailController,
      hint: 'Username',
    );
  }

  Widget _buildPasswordInput() {
    return WidgetInput(
      inputController: _passwordController,
      hint: 'Password',
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
