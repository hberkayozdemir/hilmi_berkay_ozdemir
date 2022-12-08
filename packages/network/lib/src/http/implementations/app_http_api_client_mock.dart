import 'package:network/src/http/core/app_http_api_client.dart';

class AppHttpApiClientMock extends AppHttpApiClient {
  @override
  Future<Type> getMediumStories({required Type x}) {
    // TODO: implement getMediumStories
    //  return will be mock json;
    throw UnimplementedError();
  }
}
