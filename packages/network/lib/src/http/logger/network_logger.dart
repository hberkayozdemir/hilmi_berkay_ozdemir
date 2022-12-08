import 'package:logger/logger.dart';
import 'package:network/src/http/logger/app_logger.dart';

class NetworkLogger extends AppLogger {
  NetworkLogger._();

  static final log = NetworkLogger._();

  final _log = Logger(
    printer: PrettyPrinter(
      printTime: true,
    ),
  );

  @override
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.d(message, error, stackTrace);
  }

  @override
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.e(message, error, stackTrace);
  }

  @override
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.i(message, error, stackTrace);
  }

  @override
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.v(message, error, stackTrace);
  }

  @override
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _log.w(message, error, stackTrace);
  }
}
