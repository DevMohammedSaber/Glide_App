import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/authentication/cubit/auth_states.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  final TextEditingController phoneFormField = TextEditingController();
  String countryCode = "1";
  String slectedCountry = "CA";

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      log("Google User: $googleUser");
      if (googleUser == null) {
        return null;
      }

      emit(AuthWithGoogleSuccess());
    } catch (e) {
      debugPrint("Error during Google SignIn: $e");
      emit(AuthWithGoogleError(
        error: "Error during Google SignIn: $e",
      ));

      return null;
    }
  }
}
