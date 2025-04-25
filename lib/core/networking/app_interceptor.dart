import 'package:dio/dio.dart';
import 'package:glide/core/networking/app_apis.dart';
import 'package:glide/core/networking/status_code.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/core/utils/helpers/tokens_storage.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/utils/navigation/router.dart';

class AppInterceptor extends Interceptor {
  final _tokenStorage = TokenStorage();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == StatusCode.unauthorized) {
      final refreshToken = await _tokenStorage.getRefreshToken();
      final accessToken = await _tokenStorage.getAccessToken();
      final tokenType = await _tokenStorage.getTokenType();
      final expireIn = await _tokenStorage.getExpiresIn();

      if (refreshToken != null) {
        try {
          // ✅ Use the same Dio instance with proper baseOptions
          final dio = Dio(BaseOptions(baseUrl: AppApis.baseurl));
          dio.interceptors.add(this); // reuse interceptor

          final response = await dio.post(AppApis.refreshToken, data: {
            "access_token": accessToken,
            "refresh_token": refreshToken,
            "token_type": tokenType,
            "expires_in": int.parse(expireIn ?? '0'),
          });

          final newAccessToken = response.data['access_token'];
          await _tokenStorage.saveAccessToken(newAccessToken);

          // ✅ Retry the failed request
          final requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          final retryResponse = await dio.fetch(requestOptions);
          return handler.resolve(retryResponse);
        } catch (e) {
          await _tokenStorage.clearTokens();
          await AppPreferences().clear();
          navigatorKey.currentState?.pushNamed(AppRoutes.loginScreen);
          return handler.reject(err);
        }
      }
    }

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
