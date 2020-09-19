import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/resource/database/app_database.dart';
import 'package:portfolio_website/src/resource/repo/blog_repository.dart';
import 'bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository repository;
  BlogBloc({this.repository}) : super(BlogLoading());

  @override
  Stream<BlogState> mapEventToState(BlogEvent event) async* {
    if (event is LoadBlog) {
      yield* _mapLoadToState(event.username);
    } else if (event is RefreshBlog) {
      yield BlogLoading();
      yield* _mapLoadToState(event.username);
    }
  }

  Stream<BlogState> _mapLoadToState(String username) async* {
    try {
      print('--------- Load Blog');
      final response = await fetchData(username);
      print(response);
      yield BlogLoaded(content: response);
    } catch (e) {
      yield BlogWithError(message: e.toString());
    }
  }

  Future<List<Blog>> fetchData(String username) async {
    try {
      final data = await repository.getAll(username: username);
      if (data != null && data.length != 0) {
        return data;
      } else {
        throw NullThrownError();
      }
    } catch (e) {
      throw NullThrownError();
    }
  }
}
