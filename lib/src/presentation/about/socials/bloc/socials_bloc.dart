import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/presentation/about/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/about/socials/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/resource.dart';

class SocialBloc extends Bloc<SocialEvent, SocialState> {
  SocialBloc(SocialState initialState) : super(initialState);

  @override
  Stream<SocialState> mapEventToState(SocialEvent event) async* {
    if (event is InitializeSocial) {
      yield* _mapInitToState(event.aboutBloc);
    } else if (event is SaveSocial) {
      yield* _mapSaveToState(event.aboutBloc, event.urls);
    }
  }

  Stream<SocialState> _mapInitToState(AboutBloc aboutBloc) async* {
    final aboutState = aboutBloc.state as AboutLoaded;
    await Future.delayed(Duration(seconds: 2));
    yield SocialInitialized(urls: aboutState?.profile?.urls ?? "");
  }

  Stream<SocialState> _mapSaveToState(
      AboutBloc aboutBloc, List<UrlSocialModel> urls) async* {
    yield SocialLoading();
    aboutBloc.add(EditAbout(urls: urls.toString()));
  }
}
