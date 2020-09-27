import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';

class EditerProjectState extends Equatable {
  const EditerProjectState();
  @override
  List<Object> get props => [];
}

class ProjectEditerHiding extends EditerProjectState {}

class ProjectEditerLoading extends EditerProjectState {}

class ProjectEditerLoaded extends EditerProjectState {
  final Project project;
  const ProjectEditerLoaded({this.project});
  @override
  List<Object> get props => [project];
}
