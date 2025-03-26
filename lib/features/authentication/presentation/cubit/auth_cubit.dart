import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/core/constants/prefs_keys.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/features/authentication/domain/usecases/login_with_google_usecase.dart';
import 'package:glide/features/authentication/domain/usecases/send_otp_usecase.dart';
import 'package:glide/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:glide/features/authentication/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final SendOtpUseCase sendOtp;
  final VerifyOtpUseCase verifyOtp;
  final GoogleSignInUseCase signInWithGoogle;

  AuthCubit({
    required this.sendOtp,
    required this.verifyOtp,
    required this.signInWithGoogle,
  }) : super(const AuthInitial());

  final TextEditingController phoneFormField = TextEditingController();
  String countryCode = "1";
  String slectedCountry = "CA";
  Future signInWithPhoneNumberSendOtp() async {
    emit(const AuthLoading());
    try {
      // final user = await sendOtp(phoneFormField.text);
      // debugPrint("user: $user");

      emit(const AuthWithPhoneNumberSendOtpSuccess());
    } catch (e) {
      debugPrint("Error during Phone SignIn: $e");
      emit(
        AuthWithPhoneNumberSendOtpError(
          error: "Error during Phone SignIn: $e",
        ),
      );

      return null;
    }
  }

  Future signInWithPhoneNumberVerifyOtp(
      String verificationId, String smsCode) async {
    emit(const AuthLoading());
    try {
      // final user = await verifyOtp(verificationId, smsCode);
      // debugPrint("user: $user");
      await AppPreferences().setBool(PrefKeys.isLogin, true);
      await AppPreferences()
          .setString(PrefKeys.userNumber, phoneFormField.text.toString());
      await AppPreferences()
          .setString(PrefKeys.userCountryCode, countryCode.toString());
      emit(const AuthWithPhoneNumberVerifyOtpSuccess());
    } catch (e) {
      debugPrint("Error during Phone SignIn: $e");
      emit(
        AuthWithPhoneNumberVerifyOtpError(
          error: "Error during Phone SignIn: $e",
        ),
      );

      return null;
    }
  }

  Future googleSignIn() async {
    emit(const AuthLoading());
    try {
      final user = await signInWithGoogle();
      await AppPreferences().setBool(PrefKeys.isLogin, true);
      await AppPreferences()
          .setString(PrefKeys.userNumber, user.phoneNumber ?? '');
      await AppPreferences()
          .setString(PrefKeys.userCountryCode, countryCode.toString());
      emit(const AuthWithGoogleSuccess());
    } catch (e) {
      debugPrint("Error during Google SignIn: $e");
      emit(
        AuthWithGoogleError(
          error: "Error during Google SignIn: $e",
        ),
      );

      return null;
    }
  }
}
