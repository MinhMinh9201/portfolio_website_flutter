import 'package:equatable/equatable.dart';
import 'package:portfolio_website/presentation/profile/bloc/bloc.dart';

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

class EditAbout extends AboutEvent {
  final ProfileBloc profileBloc;
  final String name;
  final String description;
  final String image;
  final String urls;
  const EditAbout(
      {this.name, this.description, this.image, this.urls, this.profileBloc});
}
