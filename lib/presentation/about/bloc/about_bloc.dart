import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/configs/configs.dart';
import 'package:portfolio_website/presentation/about/bloc/bloc.dart';
import 'package:portfolio_website/resource/resource.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final ProfileRepository repository;
  AboutBloc({this.repository}) : super(AboutLoading());

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {
    if (event is LoadAbout) {
      yield* _mapLoadToState(username: event.username);
    } else if (event is RefreshAbout) {
      yield AboutLoading();
      yield* _mapLoadToState(username: event.username);
    }
  }

  Stream<AboutState> _mapLoadToState({String username}) async* {
    try {
      print('--------Load: $username');
      final response = await fetchData(username: username);
      print('--------Load: ${response?.toJson() ?? "Null"}');
      if (response == null) {
        yield AboutWithError();
      } else
        yield AboutLoaded(profile: response);
    } catch (e) {
      yield AboutWithError();
    }
  }

  Future<Profile> fetchData({String username}) async {
    try {
      final data = await repository.get(username: username);
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
      await repository.insertOrReplace(
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
