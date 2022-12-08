import 'package:dio/dio.dart';

AppHttpClient createAppHttpClient({
  String? endPoint,
  bool? enableLogs,
  List<Interceptor>? interceptors,
}) =>
    throw UnsupportedError('');

abstract class AppHttpClient {
  factory AppHttpClient({
    String? endPoint,
    bool? enabledLogger,
  }) =>
      createAppHttpClient();

  Future<Response<T>> post<T>({
    required String path,
    required Map<String, dynamic> params,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool injectBearerToken = false,
  });



  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool? followRedirects,
    bool injectBearerToken = false,
  });
  
}
