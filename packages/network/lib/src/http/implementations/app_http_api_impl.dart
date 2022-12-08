// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:network/src/http/core/app_http_api_client.dart';
import 'package:network/src/http/core/http_client.dart';
import 'package:network/src/http/core/http_client_impl.dart';

class AppHttpApiClientImpl implements AppHttpApiClient {
  final String endPoint;
  AppHttpApiClientImpl({
    required this.endPoint,
  });

  AppHttpClient get _httpClient => AppHttpClientImpl(enableLogs: true);

  @override
  Future<Type> getMediumStories({required Type x}) async {
    final response = await _get(
      '$endPoint/x',
      // query: 
      // headers: {
      //   collationHeaderKey: user.language!.toLowerCase(),
      //   channelNameHeaderKey: mobileAppChannel,
      // },
    );
    return Type;
  }

  Future<Response> _get(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    bool? followRedirects,
    bool injectBearerToken = true,
  }) async {
    try {
      final response = await _httpClient.get(
        path: path,
        query: query,
        headers: headers,
        followRedirects: followRedirects,
        injectBearerToken: injectBearerToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
