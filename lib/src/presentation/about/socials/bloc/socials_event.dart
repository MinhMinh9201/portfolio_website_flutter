import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/presentation/about/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/model/model.dart';

class SocialEvent extends Equatable {
  const SocialEvent();
  @override
  List<Object> get props => [];
}

class InitializeSocial extends SocialEvent {
  final AboutBloc aboutBloc;
  const InitializeSocial({this.aboutBloc});
}

class SaveSocial extends SocialEvent {
  final String username;
  final List<UrlSocialModel> urls;
  final AboutBloc aboutBloc;
  const SaveSocial({this.urls, this.aboutBloc, this.username});
  @override
  List<Object> get props => [urls];
}

class SavedSocial extends SocialEvent {}

class ErrorSaveSocial extends SocialEvent {
  final String message;
  const ErrorSaveSocial({this.message});
  @override
  List<Object> get props => [message];
}
