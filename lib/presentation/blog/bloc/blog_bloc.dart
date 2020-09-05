import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_website/resource/database/app_database.dart';
import 'package:portfolio_website/resource/repo/blog_repository.dart';
import 'bloc.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository repository;
  BlogBloc({this.repository}) : super(BlogLoading());

  List<Blog> blogs = [
    Blog(
        id: 1,
        title: 'The Flutter GetX Ecosystem ~ State Management',
        description:
            'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty, performance and features. With development experience unlike any other framework, it does tick most of the boxes. However, it’s not perfect. There are some things that slow down the development from time to time.',
        image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
        isFromFirebase: 1,
        createTime: DateTime.now(),
        url:
            'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
    Blog(
        id: 2,
        title: 'The Flutter GetX Ecosystem ~ State Management',
        description:
            'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty, performance and features. With development experience unlike any other framework, it does tick most of the boxes. However, it’s not perfect. There are some things that slow down the development from time to time.',
        image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
        isFromFirebase: 1,
        createTime: DateTime.now(),
        url:
            'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
    Blog(
        id: 3,
        title: 'The Flutter GetX Ecosystem ~ State Management',
        description:
            'Flutter is awesome! It’s by far the fastest way to create truly cross platform apps without compromising beauty, performance and features. With development experience unlike any other framework, it does tick most of the boxes. However, it’s not perfect. There are some things that slow down the development from time to time.',
        image: 'https://miro.medium.com/max/700/1*pAlBTVQaImMOhq1xBbFy9w.png',
        isFromFirebase: 1,
        createTime: DateTime.now(),
        url:
            'https://medium.com/flutter-community/the-flutter-getx-ecosystem-state-management-881c7235511d'),
  ];

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
        await initData();
        return blogs;
      }
    } catch (e) {
      throw NullThrownError();
    }
  }

  Future initData() async {
    try {
      blogs.forEach((blog) {
        repository.insertBlog(blog);
      });
    } catch (e) {
      return e.toString();
    }
  }
}
