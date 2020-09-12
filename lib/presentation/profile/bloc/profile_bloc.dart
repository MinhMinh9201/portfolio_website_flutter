import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/presentation/profile/bloc/bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield* _mapLoadToState();
    }
  }

  Stream<ProfileState> _mapLoadToState() async* {
    await Future.delayed(Duration(seconds: 1));
    yield ProfileLoaded();
  }
}
