import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:network/src/http/core/http_client.dart';
import 'package:network/src/http/core/proxy_properties.dart';
import 'package:network/src/http/logger/dio_logger.dart';

class AppHttpClientImpl implements AppHttpClient {
  var token = "";
  AppHttpClientImpl({
    String? endPoint,
    this.enableLogs = false,
  }) {
    if (endPoint != null) {
      _dio.options.baseUrl = endPoint;
    }
    if (enableLogs) {
      logger = DioLogger();
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, handler) {
            logger?.onRequest(options);
            return handler.next(options);
          },
          onResponse: (Response<dynamic> response, handler) {
            logger?.onResponse(response);
            return handler.next(response);
          },
          onError: (DioError error, handler) {
            logger?.onError(error);
            return handler.next(error);
          },
        ),
      );
    }
    _dio.options.connectTimeout = AppHttpClientProxyProperties.connectTimeout;
    _dio.options.receiveTimeout = AppHttpClientProxyProperties.receiveTimeout;
    _dio.options.sendTimeout = AppHttpClientProxyProperties.sendTimeout;
  }

  final _dio = Dio();
  final bool enableLogs;
  DioLogger? logger;

  @override
  Future<Response<T>> post<T>({
    required String path,
    required Map<String, dynamic> params,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool injectBearerToken = false,
  }) async {
    var _headers = headers ?? {};
    if (injectBearerToken) {
      _headers = await _injectBearerToken(headers);
    }
    final response = await _postClient<T>(
      path,
      params,
      query: query,
      headers: _headers,
    );

    return response;
  }

  @override
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool? followRedirects,
    bool injectBearerToken = false,
  }) async {
    var _headers = headers ?? {};
    if (injectBearerToken) {
      _headers = await _injectBearerToken(headers);
    }
    final response = await _getClient<T>(
      path,
      query: query,
      headers: _headers,
      followRedirects: followRedirects,
    );

    return response;
  }

  Future<Response<T>> _getClient<T>(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool? followRedirects,
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: query,
      options: Options(
        headers: headers,
        followRedirects: followRedirects,
      ),
    );
    return response;
  }

  Future<Response<T>> _postClient<T>(
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.post<T>(
      path,
      queryParameters: query,
      data: data,
      options: Options(headers: headers),
    );
    return response;
  }


  Future<Map<String, dynamic>> _injectBearerToken(
    Map<String, dynamic>? headers,
  ) async {
    return {...?headers}..addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
  }
}
