import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/resource/repo/auth_repository.dart';

import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({this.repository}) : super(AuthState.empty());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SubmitLoginAuth) {
      yield AuthState.loading();
      yield* _mapLoginToState(event);
    } else if (event is SubmitRegisterAuth) {
      yield AuthState.loading();
      yield* _mapRegisterToState(event);
    } else {}
  }

  Stream<AuthState> _mapLoginToState(SubmitLoginAuth event) async* {
    print(event.username);
    print(event.password);
    try {
      final rs = await repository.login(
          email: event.username, password: event.password);
      print('-----Login ${rs?.toString()}');
      yield AuthState.success(message: "Success!");
    } catch (e) {
      print('-----Error: ${e.message}');
      yield AuthState.failure(message: "$e");
    }
  }

  Stream<AuthState> _mapRegisterToState(SubmitRegisterAuth event) async* {
    print(event.username);
    print(event.password);
    try {
      final rs = await repository.register(
          email: event.username, password: event.password);
      print('-----Register ${rs?.toString()}');
      yield AuthState.success(message: "Success!");
    } on FirebaseAuthException catch (e) {
      print('-----Error: ${e.message}');
      yield AuthState.failure(message: "${e.message}");
    }
  }
}
