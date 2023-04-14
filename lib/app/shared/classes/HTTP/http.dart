// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, constant_identifier_names

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:tech_task/core/setups/setups.dart';

const _60seconds = Duration(seconds: 60);

final customInterceptors = AwesomeDioInterceptor(
  logRequestTimeout: false,
  logRequestHeaders: false,
  logResponseHeaders: false,
);

const _rType = ResponseType.json;

class HTTP {
  static final Map<String, String> _headers = Map<String, String>.from(
    {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    },
  );

  static Map<String, String> get _getHeaders =>
      Map<String, String>.from(_headers);

  static List<String> headerLog = [];

  static addHeader({
    required String key,
    required String value,
  }) {
    _headers[key] = value;
    headerLog.add("$key: $value");
  }

  static Future<Response> get(String endpoint) async {
    final _dio = Dio(
      BaseOptions(
        responseType: _rType,
        headers: _getHeaders,
        baseUrl: Environment.baseUrl,
        connectTimeout: _60seconds,
        receiveTimeout: _60seconds,
      ),
    )..interceptors.add(customInterceptors);
    String url = "/$endpoint";
    final response = await _dio.get(url);
    return response;
  }
}
