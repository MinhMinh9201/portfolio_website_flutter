import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class CleanLogin extends LoginEvent {}

class SubmitLogin extends LoginEvent {
  final String username;
  final String password;
  const SubmitLogin({this.username, this.password});

  @override
  List<Object> get props => [username, password];
}
