import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/resource/repo/blog_repository.dart';
import 'bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository repository;
  BlogBloc({this.repository}) : super(BlogLoading());

  @override
  Stream<BlogState> mapEventToState(BlogEvent event) async* {
    if (event is LoadBlog) {
      yield* _mapLoadToState();
    } else if (event is RefreshBlog) {
      yield BlogLoading();
      yield* _mapLoadToState();
    }
  }

  Stream<BlogState> _mapLoadToState() async* {
    try {
      final response = await fetchData();
      yield BlogLoaded(content: response);
    } catch (e) {
      print(e);
      yield BlogWithError(message: e.toString());
    }
  }

  Future<String> fetchData() async {
    try {
      return "DATA";
    } on DioError catch (e) {
      return e.toString();
    }
  }

  // Future<String> fetchData() async {
  //   try {
  //     return await repository.blogMedium();
  //   } on DioError catch (e) {
  //     return e.toString();
  //   }
  // }
}
