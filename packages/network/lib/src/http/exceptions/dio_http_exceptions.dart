/// Thrown if an exception occurs while making an `Dio` http request.
class DioHttpException implements Exception {
  const DioHttpException(this.message);

  final String message;

  @override
  String toString() => 'DioHttpException(message: $message)';
}
