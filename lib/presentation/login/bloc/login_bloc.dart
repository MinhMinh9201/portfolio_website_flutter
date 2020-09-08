import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/resource/repo/auth_repository.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  LoginBloc({this.repository}) : super(LoginState.empty());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SubmitLogin) {
      yield LoginState.loading();
      yield* _mapLoginToState(event);
    } else if (event is CleanLogin) {
      yield LoginState.empty();
    } else {}
  }

  Stream<LoginState> _mapLoginToState(SubmitLogin event) async* {
    try {
      final rs = await repository.login(
          email: event.username, password: event.password);
      print('-----Login ${rs?.toString()}');
      yield LoginState.success(message: "Success!", user: rs.user);
    } catch (e) {
      print('-----Error: ${e.message}');
      yield LoginState.failure(message: "${e.message}");
    }
  }
}
