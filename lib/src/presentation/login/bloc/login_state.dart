import 'package:firebase_auth/firebase_auth.dart';

class LoginState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;
  final User user;

  const LoginState(
      {this.isFailure,
      this.isSubmitting,
      this.isSuccess,
      this.message,
      this.user});

  factory LoginState.empty() {
    return LoginState(
        isFailure: false,
        isSubmitting: false,
        isSuccess: false,
        message: '',
        user: null);
  }

  factory LoginState.loading() {
    return LoginState(
        isFailure: false,
        isSubmitting: true,
        isSuccess: false,
        message: '',
        user: null);
  }

  factory LoginState.failure({String message}) {
    return LoginState(
        isFailure: true,
        isSubmitting: false,
        isSuccess: false,
        message: message,
        user: null);
  }

  LoginState update({String message, User user}) {
    return copyWith(
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: message,
        user: user);
  }

  factory LoginState.success({String message, User user}) {
    return LoginState(
        isFailure: false,
        isSubmitting: false,
        isSuccess: true,
        user: user,
        message: message);
  }

  LoginState copyWith(
      {bool isSubmitting,
      bool isSuccess,
      bool isFailure,
      String message,
      User user}) {
    return LoginState(
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        message: message ?? this.message,
        user: user);
  }
}
