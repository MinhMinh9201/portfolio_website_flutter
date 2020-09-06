import 'package:equatable/equatable.dart';

class ProjectsEvent extends Equatable {
  const ProjectsEvent();
  @override
  List<Object> get props => [];
}

class LoadProjects extends ProjectsEvent {}

class RefreshProjects extends ProjectsEvent {}
