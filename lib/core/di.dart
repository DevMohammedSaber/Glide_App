import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:glide/core/networking/dio_consumer.dart';
import 'package:glide/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:glide/features/authentication/data/datasources/auth_remote_datasource_impl.dart';
import 'package:glide/features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:glide/features/authentication/domain/repositories/auth_repo.dart';
import 'package:glide/features/authentication/domain/usecases/login_with_google_usecase.dart';
import 'package:glide/features/authentication/domain/usecases/register_usecase.dart';
import 'package:glide/features/authentication/domain/usecases/send_otp_usecase.dart';
import 'package:glide/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:glide/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:glide/features/login/data/datasources/login_remote_datasource.dart';
import 'package:glide/features/login/data/datasources/login_remote_datasource_impl.dart';
import 'package:glide/features/login/data/repositories/login_repo_impl.dart';
import 'package:glide/features/login/domain/repositories/login_repo.dart';
import 'package:glide/features/login/domain/usecases/login_usecase.dart';
import 'package:glide/features/login/presentation/cubit/login_cubit.dart';
import 'package:glide/features/maps/data/datasources/booking_remote_datasource.dart';
import 'package:glide/features/maps/data/datasources/booking_remote_datasource_impl.dart';
import 'package:glide/features/maps/data/repositories/booking_repo_impl.dart';
import 'package:glide/features/maps/domain/repositories/booking_repo.dart';
import 'package:glide/features/maps/domain/usecases/booking_usecase.dart';
import 'package:glide/features/maps/presentation/cubit/booking_cubit.dart';
import 'package:google_sign_in/google_sign_in.dart';

final di = GetIt.instance;

void configureDependencies() {
  di.registerLazySingleton<Dio>(() => Dio());
  di.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  di.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.standard());

  di.registerLazySingleton<DioConsumer>(() => DioConsumer(client: di()));

  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      di<FirebaseAuth>(),
      di<GoogleSignIn>(),
      di<DioConsumer>(),
    ),
  );

  di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(di<AuthRemoteDataSource>()));
  di.registerLazySingleton<RegisterUsecase>(() => RegisterUsecase(di()));

  di.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(di<LoginRemoteDataSource>()));
  di.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(di<DioConsumer>()),
  );
  di.registerLazySingleton<LoginUsecase>(() => LoginUsecase(di()));

   di.registerLazySingleton<BookingRepository>(
      () => BookingRepositoryImpl(di<BookingRemoteDataSource>()));
  di.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(di<DioConsumer>()),
  );
  di.registerLazySingleton<BookingUsecase>(() => BookingUsecase(di()));


  di.registerLazySingleton(() => SendOtpUseCase(di()));
  di.registerLazySingleton(() => VerifyOtpUseCase(di()));
  di.registerLazySingleton(() => GoogleSignInUseCase(di()));

  di.registerFactory(() => AuthCubit(
        sendOtp: di(),
        verifyOtp: di(),
        signInWithGoogle: di(),
      ));

  di.registerFactory(() => LoginCubit(
        loginUsecase: di(),
      ));
  di.registerFactory(() => BookingCubit(
        bookingUsecase: di(),
      ));
}
