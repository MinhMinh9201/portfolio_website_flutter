import 'package:firebase_auth/firebase_auth.dart';

class RegisterState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;
  final User user;

  const RegisterState(
      {this.isFailure,
      this.isSubmitting,
      this.isSuccess,
      this.message,
      this.user});

  factory RegisterState.empty() {
    return RegisterState(
        isFailure: false,
        isSubmitting: false,
        isSuccess: false,
        message: '',
        user: null);
  }

  factory RegisterState.loading() {
    return RegisterState(
        isFailure: false,
        isSubmitting: true,
        isSuccess: false,
        message: '',
        user: null);
  }

  factory RegisterState.failure({String message}) {
    return RegisterState(
        isFailure: true,
        isSubmitting: false,
        isSuccess: false,
        message: message,
        user: null);
  }

  RegisterState update({String message, User user}) {
    return copyWith(
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: message,
        user: user);
  }

  factory RegisterState.success({String message, User user}) {
    return RegisterState(
        isFailure: false,
        isSubmitting: false,
        isSuccess: true,
        user: user,
        message: message);
  }

  RegisterState copyWith(
      {bool isSubmitting,
      bool isSuccess,
      bool isFailure,
      String message,
      User user}) {
    return RegisterState(
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        message: message ?? this.message,
        user: user);
  }
}
