import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/presentation/about/bloc/bloc.dart';

class DescriptionEvent extends Equatable {
  const DescriptionEvent();
  @override
  List<Object> get props => [];
}

class InitializeDescription extends DescriptionEvent {
  final AboutBloc aboutBloc;
  const InitializeDescription({this.aboutBloc});
}

class SaveDescription extends DescriptionEvent {
  final String description;
  final String username;
  final AboutBloc aboutBloc;
  const SaveDescription({this.description, this.aboutBloc, this.username});
  @override
  List<Object> get props => [description, username];
}

class SavedDescription extends DescriptionEvent {}

class ErrorSaveDescription extends DescriptionEvent {
  final String message;
  const ErrorSaveDescription({this.message});
  @override
  List<Object> get props => [message];
}
