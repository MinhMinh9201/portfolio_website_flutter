import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/presentation/projects/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/resource.dart';

class EditerProjectEvent extends Equatable {
  const EditerProjectEvent();
  @override
  List<Object> get props => [];
}

class LoadProjectEditer extends EditerProjectEvent {
  final Project project;
  const LoadProjectEditer({this.project});
  @override
  List<Object> get props => [project];
}

class SaveProjectEditer extends EditerProjectEvent {
  final ProjectsBloc bloc;
  final String username;
  final Project project;
  const SaveProjectEditer({this.bloc, this.project, this.username});
}

class HideProjectEditer extends EditerProjectEvent {}
