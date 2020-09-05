import 'package:equatable/equatable.dart';
import 'package:portfolio_website/resource/database/app_database.dart';

abstract class BlogState extends Equatable {
  const BlogState();
  @override
  List<Object> get props => [];
}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<Blog> content;
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
