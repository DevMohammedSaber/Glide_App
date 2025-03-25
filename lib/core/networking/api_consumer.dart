import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, String>? headers,
  });

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
  Future<dynamic> multipart({
    required String path,
    Map<String, String>? fields,
    List<MapEntry<String, MultipartFile>>? files,
    Map<String, String>? headers,
  });
}
