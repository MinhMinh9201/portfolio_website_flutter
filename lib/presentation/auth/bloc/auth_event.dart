import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class SwitchLoginRegisterAuth extends AuthEvent {
  final bool isLogin;
  const SwitchLoginRegisterAuth({this.isLogin});
}

class SubmitLoginAuth extends AuthEvent {
  final String username;
  final String password;
  const SubmitLoginAuth({this.username, this.password});

  @override
  List<Object> get props => [username, password];
}

class SubmitRegisterAuth extends AuthEvent {
  final String username;
  final String password;
  final String passwordConfirm;
  const SubmitRegisterAuth(
      {this.username, this.password, this.passwordConfirm});

  @override
  List<Object> get props => [username, password, passwordConfirm];
}
