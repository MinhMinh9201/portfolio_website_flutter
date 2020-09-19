import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';

abstract class AboutState extends Equatable {
  const AboutState();
  @override
  List<Object> get props => [];
}

class AboutLoading extends AboutState {}

class AboutEditSuccess extends AboutState {}

class AboutEditFailure extends AboutState {
  final String message;
  const AboutEditFailure({this.message});
  @override
  List<Object> get props => [message];
}

class AboutLoaded extends AboutState {
  final Profile profile;
  final bool canEdit;
  AboutLoaded({this.profile, this.canEdit});
  @override
  List<Object> get props => [profile];
}

class AboutWithError extends AboutState {
  final String message;
  AboutWithError({this.message});
  @override
  List<Object> get props => [message];
}
