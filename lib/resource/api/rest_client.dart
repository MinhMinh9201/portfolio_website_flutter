import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:portfolio_website/configs/configs.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppEndpoint.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(AppEndpoint.BLOG_MEDIUM)
  Future<dynamic> blogsMedium();
}
