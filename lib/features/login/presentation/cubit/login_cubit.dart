import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/core/utils/constants/prefs_keys.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/core/utils/helpers/tokens_storage.dart';
import 'package:glide/features/login/domain/usecases/login_usecase.dart';
import 'package:glide/features/login/presentation/cubit/login_states.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUsecase loginUsecase;
  final _tokenStorage = TokenStorage();
  LoginCubit({required this.loginUsecase}) : super(const LoginStateInitial());
  final btnController = RoundedLoadingButtonController();

  final TextEditingController emailFormField = TextEditingController();
  final TextEditingController passwordFormField = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future login() async {
    if (!formKey.currentState!.validate()) return;
    emit(const LoginStateLoading());
    btnController.start();
    final response = await loginUsecase.call(
      email: emailFormField.text,
      password: passwordFormField.text,
    );
    response.fold((l) {
      emit(
        LoginStateError(error: l.message),
      );
      btnController.error();
    }, (r) {
      _tokenStorage.saveAccessToken(r.accessToken);
      _tokenStorage.saveRefreshToken(r.refreshToken);
      _tokenStorage.saveTokenType(r.tokenType);
      _tokenStorage.saveExpiresIn(r.expiresIn.toString());
      AppPreferences().setBool(PrefKeys.isLogin, true);
      emit(const LoginStateSuccess());
      btnController.success();
    });
    await Future.delayed(const Duration(seconds: 2), () {
      btnController.stop();
      btnController.reset();
    });
  }
}
