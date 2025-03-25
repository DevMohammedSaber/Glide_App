import 'package:firebase_auth/firebase_auth.dart';
import 'package:glide/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:glide/features/authentication/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSourceImpl(this._auth, this._googleSignIn);
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
}
