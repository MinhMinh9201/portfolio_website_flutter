import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class CleanRegister extends RegisterEvent {}

class SubmitRegister extends RegisterEvent {
  final String username;
  final String password;
  final String passwordConfirm;
  const SubmitRegister({this.username, this.password, this.passwordConfirm});

  @override
  List<Object> get props => [username, password, passwordConfirm];
}
