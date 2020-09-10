import 'package:equatable/equatable.dart';
import 'package:portfolio_website/resource/database/app_database.dart';

abstract class AboutState extends Equatable {
  const AboutState();
  @override
  List<Object> get props => [];
}

class AboutLoading extends AboutState {}

class AboutLoaded extends AboutState {
  final Profile profile;
  AboutLoaded({this.profile});
  @override
  List<Object> get props => [profile];
}

class AboutWithError extends AboutState {
  final String message;
  AboutWithError({this.message});
  @override
  List<Object> get props => [message];
}
