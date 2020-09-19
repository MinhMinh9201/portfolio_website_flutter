import 'package:equatable/equatable.dart';

class DescriptionState extends Equatable {
  const DescriptionState();
  @override
  List<Object> get props => [];
}

class DescriptionLoading extends DescriptionState {}

class DescriptionInitialized extends DescriptionState {
  final String description;
  const DescriptionInitialized({this.description});
  @override
  List<Object> get props => [description];
}

class DescriptionSaved extends DescriptionState {}

class DescriptionSaveError extends DescriptionState {
  final String message;
  const DescriptionSaveError({this.message});
  @override
  List<Object> get props => [message];
}
