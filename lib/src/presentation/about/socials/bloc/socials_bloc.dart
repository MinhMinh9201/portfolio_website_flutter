import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/presentation/about/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/about/socials/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/resource.dart';
import 'package:portfolio_website/src/utils/utils.dart';

class SocialBloc extends Bloc<SocialEvent, SocialState> {
  SocialBloc() : super(SocialLoading());

  @override
  Stream<SocialState> mapEventToState(SocialEvent event) async* {
    if (event is InitializeSocial) {
      yield* _mapInitToState(event.aboutBloc);
    } else if (event is SaveSocial) {
      yield* _mapSaveToState(event.aboutBloc, event.urls);
    } else if (event is SavedSocial) {
      yield SocialSaved();
    }
  }

  Stream<SocialState> _mapInitToState(AboutBloc aboutBloc) async* {
    await Future.delayed(Duration(milliseconds: 500));
    final aboutState = aboutBloc.state as AboutLoaded;
    yield SocialInitialized(urls: aboutState?.profile?.urls ?? "");
  }

  Stream<SocialState> _mapSaveToState(
      AboutBloc aboutBloc, List<UrlSocialModel> urls) async* {
    yield SocialLoading();
    aboutBloc.add(EditAbout(urls: AppUtils.mapURL(urls)));
  }
}
