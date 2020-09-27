import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/src/presentation/blog/editer/bloc/bloc.dart';
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
    } else if (event is UpdateBlog) {
      yield BlogLoading();
      yield* _mapUpdateToState(event.blog, event.username, event.bloc);
    }
  }

  Stream<BlogState> _mapUpdateToState(
      Blog blog, String username, BlogEditerBloc bloc) async* {
    try {
      if (blog.id == null || blog.id.length == 0) {
        repository.insert(blog: blog, username: username);
      } else {
        repository.update(blog: blog, username: username, id: blog.id);
      }
    } catch (e) {} finally {
      bloc.add(HideBlogEditer());
      yield* _mapLoadToState(username);
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
    final data = await repository.getAll(username: username);
    if (data != null && data.length != 0) {
      print(data[0].id);
      return data;
    } else {
      throw NullThrownError();
    }
  }
}
