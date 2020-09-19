import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationEvent extends Equatable {
  const NavigationEvent();
  @override
  List<Object> get props => [];
}

class AuthenticatedNavigation extends NavigationEvent {
  final User user;
  const AuthenticatedNavigation({this.user});
  @override
  List<Object> get props => [user];
}

class NotAuthenticatedNavigation extends NavigationEvent {}
