import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

final httpClient = Provider.autoDispose<Dio>((ref) {
  final bearer = ref.read(templateRenderInputProvider).bearerAccessToken.trim();
  final apiBaseUrl = ref.read(templateRenderInputProvider).apiBaseUrl.trim();
  final authority = ref.read(templateRenderInputProvider).authorityId.trim();
  final httpClient = Dio(BaseOptions(
    headers: {
      "Authorization": bearer,
      "AuthorityId": authority,
    },
    baseUrl: apiBaseUrl,
  ));
  // httpClient.interceptors.add(LoggerInterceptor());
  return httpClient;
});
