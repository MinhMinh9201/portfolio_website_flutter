import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/about/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/profile/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/resource.dart';
import 'package:portfolio_website/src/utils/app_utils.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final ProfileRepository profileRepository;
  final AuthRepository authRepository;
  AboutBloc({this.profileRepository, this.authRepository})
      : super(AboutLoading());

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {
    if (event is LoadAbout) {
      yield* _mapLoadToState(
          username: event.username, isCanEdit: event.canEdit);
    } else if (event is EditAbout) {
      yield* _mapEditProfileToState(
          profileBloc: event.profileBloc,
          name: event.name,
          description: event.description,
          image: event.image,
          urls: event.urls);
    }
  }

  Stream<AboutState> _mapEditProfileToState(
      {String name,
      String description,
      String image,
      String urls,
      ProfileBloc profileBloc}) async* {
    final currentState = state;
    yield AboutLoading();
    try {
      if (currentState is AboutLoaded) {
        Profile profile = currentState.profile;
        bool status = await profileRepository.insertOrReplace(
            profile: Profile(
                email: profile.email,
                id: profile.id,
                isDefault: profile.isDefault,
                image: image ?? profile.image,
                urls: urls ?? profile.urls,
                name: name ?? profile.name,
                createTime: profile.createTime,
                description: description ?? profile.description),
            username: AppUtils.emailToUsername(email: profile.email));
        profileBloc?.add(SwitchControlProfile(editing: false));
        if (status) {
          yield AboutEditSuccess();
          yield* _mapLoadToState(
              username: AppUtils.emailToUsername(email: profile.email));
        } else
          yield AboutEditFailure(message: "Error! Please try again later!");
      }
    } catch (e) {
      yield AboutEditFailure(message: e.toString());
    }
  }

  Stream<AboutState> _mapLoadToState({String username, bool isCanEdit}) async* {
    try {
      final response = await fetchData(username: username);
      print('--------Load $username: ${response?.toJson() ?? "Null"}');
      if (response != null || isCanEdit) {
        yield AboutLoaded(profile: response, canEdit: isCanEdit);
      } else {
        yield AboutWithError();
      }
    } catch (e) {
      yield AboutWithError();
    }
  }

  Future<Profile> fetchData({String username}) async {
    try {
      final data = await profileRepository.get(username: username);
      return data;
    } catch (e) {
      throw NullThrownError();
    }
  }

  Future initData() async {
    try {
      String urls = "";
      for (int i = 0; i < AppDefautls.urls.length; i++) {
        if (i < AppDefautls.urls.length - 1)
          urls += '${AppDefautls.urls[i].toString()}||';
        else
          urls += '${AppDefautls.urls[i].toString()}';
      }
      AppDefautls.urls.forEach((element) {});
      await profileRepository.insertOrReplace(
          profile: Profile(
              email: AppDefautls.email,
              isDefault: 1,
              image: AppDefautls.avatar,
              id: AppDefautls.uid,
              urls: urls,
              name: AppDefautls.name,
              createTime: DateTime.now(),
              description: AppDefautls.description));
    } catch (e) {
      print(e);
    }
  }
}
