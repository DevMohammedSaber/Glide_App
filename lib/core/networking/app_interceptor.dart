import 'package:dio/dio.dart';
import 'package:glide/core/navigation/app_routes.dart';
import 'package:glide/core/navigation/router.dart';
import 'package:glide/core/networking/status_code.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // options.headers["Authorization"] = "Bearer your_token";
    // log("📤 Sending Request: ${options.method} ${options.uri}");
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      dynamic response, ResponseInterceptorHandler handler) async {
    // log("✅ Response: ${response.statusCode} ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // log("❌ Error: ${err.response?.statusCode} ${err.message}");
    super.onError(err, handler);
    if (err.response?.statusCode == StatusCode.internalServerError) {}
  }
}

void restartApp() {
  navigatorKey.currentState?.pushNamedAndRemoveUntil(
      AppRoutes.authenticationScreen, (route) => false);
}
