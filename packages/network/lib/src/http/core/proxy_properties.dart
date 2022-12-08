class AppHttpClientProxyProperties {
  /// Set the duration interval range to make a request again
  static const delayDurationMilliseconds = 500;

  /// Set connect timeout of the http client
  static const connectTimeout = 30000;

  /// Set receive timeout of the http client
  static const receiveTimeout = 30000;

  /// Set send timeout of the http client
  static const sendTimeout = 30000;
}
