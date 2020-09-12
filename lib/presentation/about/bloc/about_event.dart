import 'package:equatable/equatable.dart';

abstract class AboutEvent extends Equatable {
  const AboutEvent();
  @override
  List<Object> get props => [];
}

class LoadAbout extends AboutEvent {
  final String username;
  const LoadAbout({this.username});
}

class RefreshAbout extends AboutEvent {
  final String username;
  const RefreshAbout({this.username});
}
