
import 'package:dio/dio.dart';
import 'package:flutter_getx_template/app/network/pretty_dio_logger.dart';
import 'package:flutter_getx_template/app/network/request_headers.dart';
import 'package:flutter_getx_template/app/network/token_refresh_interceptor.dart';
import 'package:flutter_getx_template/flavors/build_config.dart';

class DioProvider {
  static final String baseUrl = BuildConfig.instance.config.baseUrl;

  static Dio? _instance;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 60 * 1000,
    receiveTimeout: 60 * 1000,
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    } else {
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  static Dio get tokenClient{
    _addInterceptors();

    return _instance!;
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors(shouldRetryOnError: true);

    return _instance!;
  }

  static _addInterceptors({bool shouldRetryOnError = false}){
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
    if(shouldRetryOnError){
      _instance!.interceptors.add(TokenRefreshInterceptor());
    }
    _instance!.interceptors.add(_prettyDioLogger);

  }

  static String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }

  DioProvider.setContentType(String version) {
    _instance?.options.contentType = _buildContentType(version);
  }

  DioProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }
}