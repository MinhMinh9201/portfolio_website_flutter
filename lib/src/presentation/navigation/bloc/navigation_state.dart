import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationState extends Equatable {
  const NavigationState();
  @override
  List<Object> get props => [];
}

class NavigationInitialize extends NavigationState {}

class NavigationAuthenticated extends NavigationState {
  final User user;
  const NavigationAuthenticated({this.user});

  @override
  List<Object> get props => [user];
}

class NavigationNotAuthenticated extends NavigationState {}
