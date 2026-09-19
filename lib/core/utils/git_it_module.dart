import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/network/api_client.dart';
import 'package:e_commerce_app/core/network/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GitItModule {
  @LazySingleton()
  BaseOptions get baseOptions => BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    sendTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
  );

  @LazySingleton()
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
  );

  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @lazySingleton
  ApiClient get provideApiClient => ApiClient(provideDio(baseOptions, prettyDioLogger));

  @lazySingleton
  Connectivity get provideConnectivity => Connectivity();
}
