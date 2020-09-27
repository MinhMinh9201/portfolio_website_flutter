import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/presentation/blog/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';

class BlogEditerEvent extends Equatable {
  const BlogEditerEvent();
  @override
  List<Object> get props => [];
}

class LoadBlogEditer extends BlogEditerEvent {
  final Blog blog;
  const LoadBlogEditer({this.blog});
  @override
  List<Object> get props => [];
}

class HideBlogEditer extends BlogEditerEvent {
  const HideBlogEditer();
  @override
  List<Object> get props => [];
}

class SaveBlogEditer extends BlogEditerEvent {
  final Blog blog;
  final BlogBloc bloc;
  final String username;
  const SaveBlogEditer({this.blog, this.bloc, this.username});
  @override
  List<Object> get props => [blog, bloc];
}
