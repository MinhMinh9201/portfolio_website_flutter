import 'package:equatable/equatable.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';

class BlogEditerState extends Equatable {
  const BlogEditerState();
  @override
  List<Object> get props => [];
}

class BlogEditerHiding extends BlogEditerState {}

class BlogEditerLoading extends BlogEditerState {}

class BlogEditerLoaded extends BlogEditerState {
  final Blog blog;
  const BlogEditerLoaded({this.blog});
}
