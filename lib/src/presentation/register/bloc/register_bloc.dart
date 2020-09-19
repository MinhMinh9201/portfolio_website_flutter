import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/resource/repo/auth_repository.dart';

import 'bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository repository;
  RegisterBloc({this.repository}) : super(RegisterState.empty());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is SubmitRegister) {
      yield RegisterState.loading();
      yield* _mapRegisterToState(event);
    }
    if (event is CleanRegister) {
      yield RegisterState.empty();
    } else {}
  }

  Stream<RegisterState> _mapRegisterToState(SubmitRegister event) async* {
    try {
      if (event.password != event.passwordConfirm) {
        yield RegisterState.failure(
            message: "Confirm password and password not match.");
        return;
      }
      final rs = await repository.register(
          email: event.username, password: event.password);
      yield RegisterState.success(message: "Success!", user: rs.user);
    } on FirebaseAuthException catch (e) {
      print('-----Error: ${e.message}');
      yield RegisterState.failure(message: "${e.message}");
    }
  }
}
