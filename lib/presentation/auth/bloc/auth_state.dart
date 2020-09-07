// import 'package:equatable/equatable.dart';

// class AuthState extends Equatable {
//   const AuthState();
//   @override
//   List<Object> get props => [];
// }

class AuthState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  const AuthState(
      {this.isFailure, this.isSubmitting, this.isSuccess, this.message});

  factory AuthState.empty() {
    return AuthState(
        isFailure: false, isSubmitting: false, isSuccess: false, message: '');
  }

  factory AuthState.loading() {
    return AuthState(
        isFailure: false, isSubmitting: true, isSuccess: false, message: '');
  }

  factory AuthState.failure({String message}) {
    return AuthState(
        isFailure: true,
        isSubmitting: false,
        isSuccess: false,
        message: message);
  }

  AuthState update({String message}) {
    return copyWith(
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: message);
  }

  factory AuthState.success({String message}) {
    return AuthState(
        isFailure: false,
        isSubmitting: false,
        isSuccess: true,
        message: message);
  }

  AuthState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    String message,
  }) {
    return AuthState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}
