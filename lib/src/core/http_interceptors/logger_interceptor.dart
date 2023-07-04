import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends QueuedInterceptor {
  @override
  void onRequest(options, handler) async {
    debugPrint('LoggerInterceptor 🔥');
    debugPrint(
        'REQUEST[${options.method}] => PATH: ${options.path} => [${options.queryParameters}]');
    debugPrint('HEADERS : ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, handler) async {
    debugPrint('LoggerInterceptor 🔥');

    debugPrint(
        'RESPONSE[${response.requestOptions.path}] => DATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(err, handler) async {
    debugPrint('LoggerInterceptor 🔥');

    debugPrint("ERROR : ${err.toString()} STACKTRACE ${err.stackTrace}");
    super.onError(err, handler);
  }
}
