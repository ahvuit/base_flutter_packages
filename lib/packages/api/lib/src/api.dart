import 'package:api/src/url_builder.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:domain_models/domain_models.dart';

typedef UserTokenSupplier = Future<String?> Function();

class Api {

  static const _errorCodeJsonKey = 'error_code';
  static const _errorMessageJsonKey = 'message';

  Api._({
    required UserTokenSupplier userTokenSupplier,
    @visibleForTesting Dio? dio,
    @visibleForTesting UrlBuilder? urlBuilder,
  })  : _dio = dio ?? Dio(),
        _urlBuilder = urlBuilder ?? const UrlBuilder() {
    _dio.interceptors.add(
      LogInterceptor(responseBody: false),
    );
  }

  final Dio _dio;
  final UrlBuilder _urlBuilder;


}

