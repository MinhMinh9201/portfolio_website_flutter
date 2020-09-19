import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {
  final bool hasAuth;
  final String username;
  const LoadProfile({this.hasAuth, this.username});
}

class SwitchControlProfile extends ProfileEvent {
  final bool editing;
  const SwitchControlProfile({this.editing});
}
