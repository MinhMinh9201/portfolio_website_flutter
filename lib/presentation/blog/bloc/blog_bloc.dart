import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/resource/database/app_database.dart';
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
      yield BlogWithError(message: e.toString());
    }
  }

  Future<List<Blog>> fetchData() async {
    try {
      final data = await repository.getAll();
      if (data != null && data.length != 0) {
        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw NullThrownError();
    }
  }
}
