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
      yield* _mapLoadToState();
    } else if (event is RefreshAbout) {
      yield AboutLoading();
      yield* _mapLoadToState();
    }
  }

  Stream<AboutState> _mapLoadToState() async* {
    try {
      final response = await fetchData();
      if (response == null) {
        repository.insert(
            profile: Profile(
                email: AppDefautls.email,
                isDefault: 1,
                name: AppDefautls.name,
                createTime: DateTime.now(),
                description: AppDefautls.description));
        AboutWithError(message: "Profile null :))");
      }
      yield AboutLoaded(profile: response);
    } catch (e) {
      yield AboutWithError(message: e.toString());
    }
  }

  Future<Profile> fetchData() async {
    try {
      final data = await repository.get();
      return data;
    } catch (e) {
      throw NullThrownError();
    }
  }
}
