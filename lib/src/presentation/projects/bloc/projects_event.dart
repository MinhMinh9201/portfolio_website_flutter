import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/presentation/projects/editer/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/resource.dart';

class ProjectsEvent extends Equatable {
  const ProjectsEvent();
  @override
  List<Object> get props => [];
}

class UpdateProject extends ProjectsEvent {
  final Project project;
  final String username;
  final EditerProjectBloc bloc;
  const UpdateProject({this.bloc, this.project, this.username});
}

class LoadProjects extends ProjectsEvent {
  final String username;
  const LoadProjects({this.username});
  @override
  List<Object> get props => [username];
}

class RefreshProjects extends ProjectsEvent {
  final String username;
  const RefreshProjects({this.username});
  @override
  List<Object> get props => [username];
}
