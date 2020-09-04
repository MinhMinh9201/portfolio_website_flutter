import 'package:equatable/equatable.dart';

abstract class BlogState extends Equatable {
  const BlogState();
  @override
  List<Object> get props => [];
}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final String content;
  BlogLoaded({this.content});
  @override
  List<Object> get props => [content];
}

class BlogWithError extends BlogState {
  final String message;
  BlogWithError({this.message});
  @override
  List<Object> get props => [message];
}
