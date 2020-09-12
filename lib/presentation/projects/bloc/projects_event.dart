import 'package:equatable/equatable.dart';

class ProjectsEvent extends Equatable {
  const ProjectsEvent();
  @override
  List<Object> get props => [];
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
