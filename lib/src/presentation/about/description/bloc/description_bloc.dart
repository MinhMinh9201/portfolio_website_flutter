import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/presentation/about/bloc/about_bloc.dart';
import 'package:portfolio_website/src/presentation/about/bloc/about_event.dart';
import 'package:portfolio_website/src/presentation/about/bloc/about_state.dart';
import 'package:portfolio_website/src/presentation/about/description/bloc/description_event.dart';
import 'package:portfolio_website/src/presentation/about/description/bloc/description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  DescriptionBloc() : super(DescriptionLoading());

  @override
  Stream<DescriptionState> mapEventToState(DescriptionEvent event) async* {
    if (event is InitializeDescription) {
      yield* _mapInitToState(event.aboutBloc);
    } else if (event is SaveDescription) {
      yield* _mapSaveToState(event.aboutBloc, event.description);
    }
  }

  Stream<DescriptionState> _mapInitToState(AboutBloc aboutBloc) async* {
    final aboutState = aboutBloc.state as AboutLoaded;
    await Future.delayed(Duration(seconds: 2));
    yield DescriptionInitialized(description: aboutState?.profile?.description);
  }

  Stream<DescriptionState> _mapSaveToState(
      AboutBloc aboutBloc, String description) async* {
    yield DescriptionLoading();
    aboutBloc.add(EditAbout(description: description));
  }
}
