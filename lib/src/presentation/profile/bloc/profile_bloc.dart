import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/presentation/profile/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/repo/auth_repository.dart';
import 'package:portfolio_website/src/utils/utils.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository repository;
  ProfileBloc({this.repository}) : super(ProfileLoading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield ProfileLoading();
      yield* _mapLoadToState(event.hasAuth, event.username);
    } else if (event is SwitchControlProfile) {
      yield* _mapSwitchEditingToState(event.editing);
    }
  }

  Stream<ProfileState> _mapLoadToState(bool hasAuth, String username) async* {
    if (hasAuth) {
      User user = repository.user;
      if (username == AppUtils.emailToUsername(email: user.email)) {
        yield ProfileLoaded(isCanEdit: true, isEditing: false);
      } else {
        yield ProfileLoaded(isCanEdit: false, isEditing: false);
      }
    } else {
      yield ProfileLoaded(isCanEdit: false, isEditing: false);
    }
  }

  Stream<ProfileState> _mapSwitchEditingToState(bool status) async* {
    final currentState = state;
    yield ProfileLoading();
    if (currentState is ProfileLoaded && currentState.isCanEdit) {
      if (status != currentState.isEditing) {
        yield currentState.copyWith(isEditing: status);
      }
    } else {
      yield ProfileLoaded(isCanEdit: false, isEditing: false);
    }
  }
}
