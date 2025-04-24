import 'package:dio/dio.dart';
import 'package:glide/core/networking/app_apis.dart';
import 'package:glide/core/utils/helpers/tokens_storage.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/utils/navigation/router.dart';
import 'package:glide/core/networking/status_code.dart';

class AppInterceptor extends Interceptor {
  final _tokenStorage = TokenStorage();
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // log("📤 Sending Request: ${options.method} ${options.uri}");

    super.onRequest(options, handler);
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
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
    if (err.response?.statusCode == StatusCode.unauthorized) {
      final refreshToken = await _tokenStorage.getRefreshToken();
      final accessToken = await _tokenStorage.getAccessToken();
      final tokenType = await _tokenStorage.getTokenType();
      final expireIn = await _tokenStorage.getExpiresIn();

      if (refreshToken != null) {
        try {
          final dio = Dio();
          final response = await dio.post(AppApis.refreshToken, data: {
            "access_token": accessToken,
            'refresh_token': refreshToken,
            "token_type": tokenType,
            "expires_in": int.parse(expireIn ?? '0'),
          });

          final newAccessToken = response.data['access_token'];
          await _tokenStorage.saveAccessToken(newAccessToken);

          // Retry the failed request with new token
          final requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          final retryResponse = await dio.fetch(requestOptions);
          return handler.resolve(retryResponse);
        } catch (e) {
          await _tokenStorage.clearTokens();
        }
      }
    }
  }
}

void restartApp() {
  navigatorKey.currentState?.pushNamedAndRemoveUntil(
      AppRoutes.authenticationScreen, (route) => false);
}
