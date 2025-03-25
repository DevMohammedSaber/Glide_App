import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:glide/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:glide/features/authentication/data/datasources/auth_remote_datasource_impl.dart';
import 'package:glide/features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:glide/features/authentication/domain/repositories/auth_repo.dart';
import 'package:glide/features/authentication/domain/usecases/login_with_google_usecase.dart';
import 'package:glide/features/authentication/domain/usecases/send_otp_usecase.dart';
import 'package:glide/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:glide/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:google_sign_in/google_sign_in.dart';

final di = GetIt.instance;

void configureDependencies() {
  // BLoC
  di.registerFactory(() => AuthCubit(
        sendOtp: di(),
        verifyOtp: di(),
        signInWithGoogle: di(),
      ));

  // Use cases
  di.registerLazySingleton(() => SendOtpUseCase(di()));
  di.registerLazySingleton(() => VerifyOtpUseCase(di()));
  di.registerLazySingleton(() => GoogleSignInUseCase(di()));

  // Repository
  di.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(di(),));

  // Data source
  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      FirebaseAuth.instance,
      GoogleSignIn.standard(),
    ),
  );
}
