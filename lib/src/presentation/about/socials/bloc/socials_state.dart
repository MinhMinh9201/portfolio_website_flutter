import 'package:equatable/equatable.dart';

class SocialState extends Equatable {
  const SocialState();
  @override
  List<Object> get props => [];
}

class SocialLoading extends SocialState {}

class SocialInitialized extends SocialState {
  final String urls;
  const SocialInitialized({this.urls});
  @override
  List<Object> get props => [urls];
}

class SocialSaved extends SocialState {}
