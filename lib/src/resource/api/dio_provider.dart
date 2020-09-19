// import 'package:dio/dio.dart';
// import 'package:portfolio_website/configs/configs.dart';

// class DioProvider {
//   static final Dio _dio = Dio();

//   static Dio instance() {
//     _dio
//       ..options.baseUrl = AppEndpoint.BASE_URL
//       ..options.connectTimeout = AppEndpoint.connectionTimeout
//       ..options.receiveTimeout = AppEndpoint.receiveTimeout
//       ..options.headers = {
//         'content-type': 'application/json; charset=utf-8',
//         'Content-Type': 'multipart/form-data',
//       }
//       ..interceptors.add(LogInterceptor(
//         request: true,
//         responseBody: true,
//         requestBody: true,
//         requestHeader: true,
//       ));
//     return _dio;
//   }

//   static void baseURL(String url) {
//     _dio..options.baseUrl = url;
//   }
// }
