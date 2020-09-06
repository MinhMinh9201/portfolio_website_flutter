import 'package:equatable/equatable.dart';
import 'package:portfolio_website/resource/database/app_database.dart';

class ProjectsState extends Equatable {
  const ProjectsState();
  @override
  List<Object> get props => [];
}

class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  final List<Project> projects;

  const ProjectsLoaded({this.projects});

  @override
  List<Object> get props => [projects];
}

class ProjectsWithError extends ProjectsState {
  final String message;

  const ProjectsWithError({this.message});

  @override
  List<Object> get props => [message];
}
