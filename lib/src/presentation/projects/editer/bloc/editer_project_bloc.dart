import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/presentation/projects/bloc/bloc.dart';
import 'package:portfolio_website/src/presentation/projects/editer/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';

class EditerProjectBloc extends Bloc<EditerProjectEvent, EditerProjectState> {
  EditerProjectBloc() : super(ProjectEditerHiding());

  @override
  Stream<EditerProjectState> mapEventToState(EditerProjectEvent event) async* {
    if (event is LoadProjectEditer) {
      yield* _loadToState(event.project);
    } else if (event is HideProjectEditer) {
      yield* _hideToState();
    } else if (event is SaveProjectEditer) {
      yield* _saveToState(event.project, event.bloc, event.username);
    }
  }

  Stream<EditerProjectState> _saveToState(
      Project project, ProjectsBloc bloc, String username) async* {
    bloc.add(UpdateProject(project: project, username: username, bloc: this));
  }

  Stream<EditerProjectState> _loadToState(Project project) async* {
    yield ProjectEditerLoading();
    await Future.delayed(Duration(seconds: 1));
    yield ProjectEditerLoaded(project: project);
  }

  Stream<EditerProjectState> _hideToState() async* {
    yield ProjectEditerHiding();
  }
}
