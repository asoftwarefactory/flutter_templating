import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../http_interceptors/logger_interceptor.dart';
import '../providers/providers.dart';

final httpClient = Provider.autoDispose<Dio>((ref) {
  final templateRenderInput = ref.read(templateRenderInputProvider);
  final bearer = templateRenderInput.bearerAccessToken.trim();
  final apiBaseUrl = templateRenderInput.apiBaseUrl.trim();
  final authority = templateRenderInput.authorityId.trim();
  final httpClient = Dio(BaseOptions(
    headers: {
      "Authorization": bearer,
      "AuthorityId": authority,
    },
    baseUrl: apiBaseUrl,
  ));
  if (templateRenderInput.enableDebugLog) {
    httpClient.interceptors.add(LoggerInterceptor());
  }
  return httpClient;
});
