import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glide/core/networking/app_apis.dart';
import 'package:glide/core/networking/dio_consumer.dart';
import 'package:glide/core/networking/failure.dart';
import 'package:glide/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:glide/features/authentication/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final DioConsumer _dioConsumer;

  AuthRemoteDataSourceImpl(this._auth, this._googleSignIn, this._dioConsumer);
  @override
  Future<String> sendOtp(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return '';
  }

  @override
  Future<AuthModel> verifyOtp(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return _mapFirebaseUser(userCredential.user!);
  }

  @override
  Future<AuthModel> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return _mapFirebaseUser(userCredential.user!);
  }

  AuthModel _mapFirebaseUser(User user) => AuthModel(
        uid: user.uid,
        phoneNumber: user.phoneNumber,
        email: user.email,
        displayName: user.displayName,
        providerId: user.providerData.first.providerId,
      );

  @override
  Future<Either<Failure, AuthModel>> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber}) async {
    try {
      final Response response = await _dioConsumer.post(
        path: AppApis.register,
        body: {
          "username": userName,
          "email": email,
          "password": password,
          "confirm_password": password,
          "phone": phoneNumber,
          "role": "customer",
        },
      );

      if (response.statusCode.toString().contains('20')) {
        return Right(AuthModel.fromJson(response.data));
      } else {
        return Left(Failure(message: response.data['message']));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
