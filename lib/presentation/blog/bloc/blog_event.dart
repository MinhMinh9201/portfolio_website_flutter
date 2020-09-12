import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();
  @override
  List<Object> get props => [];
}

class LoadBlog extends BlogEvent {
  final String username;
  const LoadBlog({this.username});
  @override
  List<Object> get props => [username];
}

class RefreshBlog extends BlogEvent {
  final String username;
  const RefreshBlog({this.username});
  @override
  List<Object> get props => [username];
}
