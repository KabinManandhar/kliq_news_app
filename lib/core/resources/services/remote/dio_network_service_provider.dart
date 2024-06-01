import 'package:dio/dio.dart';
import 'package:kliq_news_app/core/global/constants/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_network_service_provider.g.dart';

@riverpod
Dio networkService(NetworkServiceRef ref) {
  final Dio dio = Dio(
    BaseOptions(
      queryParameters: {
        'apikey': const String.fromEnvironment(AppConstants.newsApiKey),
        'language': 'ne,en',
        'country': 'in,np,us'
      },
      contentType: Headers.jsonContentType,
    ),
  );
  dio.interceptors.add(PrettyDioLogger());
// customization
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dio;
}
