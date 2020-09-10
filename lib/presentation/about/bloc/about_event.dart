import 'package:equatable/equatable.dart';

abstract class AboutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadAbout extends AboutEvent {}

class RefreshAbout extends AboutEvent {}
