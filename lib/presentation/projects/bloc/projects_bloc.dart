import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/presentation/projects/bloc/bloc.dart';
import 'package:portfolio_website/resource/database/app_database.dart';
import 'package:portfolio_website/resource/repo/project_repository.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final ProjectRepository repository;

  ProjectsBloc({this.repository}) : super(ProjectsLoading());

  @override
  Stream<ProjectsState> mapEventToState(ProjectsEvent event) async* {
    if (event is LoadProjects) {
      yield* _mapLoadToState();
    } else if (event is RefreshProjects) {
      yield ProjectsLoading();
      yield* _mapLoadToState();
    }
  }

  Stream<ProjectsState> _mapLoadToState() async* {
    try {
      final response = await fetchData();
      yield ProjectsLoaded(projects: response);
    } catch (e) {
      yield ProjectsWithError(message: e.toString());
    }
  }

  Future<List<Project>> fetchData() async {
    try {
      final data = await repository.getAllDao();
      if (data != null && data.length != 0) {
        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw NullThrownError();
    }
  }
}
