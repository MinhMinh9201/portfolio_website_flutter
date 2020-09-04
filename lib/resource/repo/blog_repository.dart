import 'package:dio/dio.dart';
import 'package:portfolio_website/resource/api/rest_client.dart';

class BlogRepository {
  final Dio dio;
  const BlogRepository({this.dio});

  Future<dynamic> blogMedium() async {
    final client = RestClient(dio);
    return client.blogsMedium();
  }
}
