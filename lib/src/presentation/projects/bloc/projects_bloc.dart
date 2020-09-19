import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/configs/configs.dart';
import 'package:portfolio_website/src/presentation/projects/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';
import 'package:portfolio_website/src/resource/repo/project_repository.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final ProjectRepository repository;

  ProjectsBloc({this.repository}) : super(ProjectsLoading());

  @override
  Stream<ProjectsState> mapEventToState(ProjectsEvent event) async* {
    if (event is LoadProjects) {
      yield* _mapLoadToState(event.username);
    } else if (event is RefreshProjects) {
      yield ProjectsLoading();
      yield* _mapLoadToState(event.username);
    }
  }

  Stream<ProjectsState> _mapLoadToState(String username) async* {
    try {
      print('--------- Load Project');
      final response = await fetchData(username);
      print(response);
      yield ProjectsLoaded(projects: response);
    } catch (e) {
      yield ProjectsWithError(message: e.toString());
    }
  }

  Future initData() async {
    try {
      AppDefautls.projects.forEach((element) {
        repository.insert(project: element);
      });
    } catch (e) {
      print('-----------------Error');
      print(e);
    }
  }

  Future<List<Project>> fetchData(String username) async {
    try {
      final data = await repository.getAll(username: username);
      if (data != null && data.length != 0) {
        return data;
      } else {
        throw NullThrownError();
      }
    } catch (e) {
      throw NullThrownError();
    }
  }
}
