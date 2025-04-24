import 'package:dio/dio.dart';
import 'package:glide/core/networking/api_consumer.dart';
import 'package:glide/core/networking/app_interceptor.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    _configureClient();
  }

  void _configureClient() {
    client.options
      ..followRedirects = false
      ..receiveDataWhenStatusError = true
      ..responseType = ResponseType.json;

    client.interceptors.add(AppInterceptor());
    client.interceptors.add(
      PrettyDioLogger(
        request: false,
        requestBody: true,
      ),
    );
  }

  @override
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    return _handleRequest(
      () => client.get(path, queryParameters: queryParameters),
      headers: headers,
    );
  }

  @override
  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, String>? headers,
  }) async {
    return _handleRequest(
      () => client.post(path, queryParameters: queryParameters, data: body),
      headers: headers,
    );
  }

  @override
  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    return _handleRequest(
      () => client.put(path, queryParameters: queryParameters, data: body),
      headers: headers,
    );
  }

  @override
  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    return _handleRequest(
      () => client.delete(path, queryParameters: queryParameters, data: body),
      headers: headers,
    );
  }

  @override
  Future<dynamic> multipart({
    required String path,
    Map<String, String>? fields,
    List<MapEntry<String, MultipartFile>>? files,
    Map<String, String>? headers,
    Function(int sent, int total)? onSendProgress,
  }) async {
    final FormData formData = FormData();
    if (fields != null) formData.fields.addAll(fields.entries);
    if (files != null) formData.files.addAll(files);

    return _handleRequest(
      () => client.post(path, data: formData, onSendProgress: onSendProgress),
      headers: headers,
    );
  }

  /// Handles the request and processes the response.
  Future<dynamic> _handleRequest(
    Future<Response> Function() request, {
    Map<String, String>? headers,
  }) async {
    try {
      client.options.headers = headers;
      final response = await request();
      return _handleResponseAsJson(response);
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw UnexpectedFailure('Something went wrong. Please try again: $e');
    }
  }

  /// Converts the response to JSON if necessary.
  dynamic _handleResponseAsJson(Response<dynamic> response) {
    return response;
  }

  /// Handles Dio-specific errors and returns a [Failure] object.
  Failure _handleError(DioException exception) {
    String errorMessage = 'An error occurred. Please try again later.';
    if (exception.response != null) {
      final errorResponse = exception.response?.data;
      if (errorResponse is Map) {
        errorMessage = errorResponse['message'] ?? errorMessage;
      }
    }

    return Failure(message: errorMessage);
  }
}
