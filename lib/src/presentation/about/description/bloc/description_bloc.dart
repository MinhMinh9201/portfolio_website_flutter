import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/presentation/about/bloc/bloc.dart';

import 'bloc.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  DescriptionBloc() : super(DescriptionLoading());

  @override
  Stream<DescriptionState> mapEventToState(DescriptionEvent event) async* {
    if (event is InitializeDescription) {
      yield* _mapInitToState(event.aboutBloc);
    } else if (event is SaveDescription) {
      yield* _mapSaveToState(event.aboutBloc, event.description);
    } else if (event is SavedDescription) {
      yield DescriptionSaved();
    } else if (event is ErrorSaveDescription) {
      yield DescriptionSaveError();
    }
  }

  Stream<DescriptionState> _mapInitToState(AboutBloc aboutBloc) async* {
    await Future.delayed(Duration(milliseconds: 500));
    final aboutState = aboutBloc.state as AboutLoaded;
    yield DescriptionInitialized(description: aboutState?.profile?.description);
  }

  Stream<DescriptionState> _mapSaveToState(
      AboutBloc aboutBloc, String description) async* {
    yield DescriptionLoading();
    aboutBloc.add(EditAbout(description: description));
  }
}
