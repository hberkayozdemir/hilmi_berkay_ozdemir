import 'package:dio/dio.dart';
import 'package:network/src/http/logger/network_logger.dart';

class DioLogger {
  factory DioLogger() => DioLogger._();

  DioLogger._();

  final log = NetworkLogger.log;

  void onRequest(RequestOptions options) {
    log.i(
      '''
      Request Path: [${options.method}] ${options.baseUrl}${options.path}
      Request Headers: ${options.headers} 
      Request Query: ${options.queryParameters} 
      Request Data: ${options.data}
      ''',
    );
  }

  void onResponse(Response<dynamic> response) {
    log.i(
      '''
      Response Path: [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path} 
      Response StatusCode: ${response.statusCode}
      Response Data: ${response.data}
      ''',
    );
  }

  void onError(DioError error) {
    log.e(
      '''
      Error Path: [${error.response!.requestOptions.method}] ${error.response!.requestOptions.baseUrl}${error.response!.requestOptions.path}
      Error StatusCode: ${error.response!.statusCode} 
      Error Message : ${error.message}
      ''',
    );
  }
}
