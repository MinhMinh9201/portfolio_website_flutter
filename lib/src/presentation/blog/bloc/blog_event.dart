import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/presentation/blog/editer/bloc/bloc.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();
  @override
  List<Object> get props => [];
}

class LoadBlog extends BlogEvent {
  final String username;
  final bool isCanEdit;
  const LoadBlog({this.username, this.isCanEdit});
  @override
  List<Object> get props => [username, this.isCanEdit];
}

class RefreshBlog extends BlogEvent {
  final String username;
  final bool isCanEdit;
  const RefreshBlog({this.username, this.isCanEdit});
  @override
  List<Object> get props => [username, this.isCanEdit];
}

class UpdateBlog extends BlogEvent {
  final String username;
  final Blog blog;
  final BlogEditerBloc bloc;
  const UpdateBlog({this.blog, this.username, this.bloc});
  @override
  List<Object> get props => [blog];
}
