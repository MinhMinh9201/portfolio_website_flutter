import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/presentation/projects/bloc/bloc.dart';
import 'package:portfolio_website/resource/database/app_database.dart';
import 'package:portfolio_website/resource/repo/project_repository.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final ProjectRepository repository;

  ProjectsBloc({this.repository}) : super(ProjectsLoading());

  final List<Project> projects = [
    Project(
        id: 1,
        name: 'ViSafe',
        description:
            'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty...',
        image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
        isFromFirebase: 1,
        createTime: DateTime.now(),
        url:
            'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
    Project(
        id: 2,
        name: 'ViSafe',
        description:
            'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty...',
        image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
        isFromFirebase: 1,
        createTime: DateTime.now(),
        url:
            'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
    Project(
        id: 3,
        name: 'ViSafe',
        description:
            'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty...',
        image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
        isFromFirebase: 1,
        createTime: DateTime.now(),
        url:
            'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
  ];

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
      final data = await repository.getAll();
      if (data != null && data.length != 0) {
        return data;
      } else {
        await initData();
        return projects;
      }
    } catch (e) {
      throw NullThrownError();
    }
  }

  Future initData() async {
    try {
      projects.forEach((project) {
        repository.insertProject(project);
      });
    } catch (e) {
      return e.toString();
    }
  }
}
