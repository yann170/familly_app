import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:familly_apps/features/ auth/ data/datasources/auth_remote_datasource.dart';
import 'package:familly_apps/features/ auth/ data/repositories/auth_repository_impl.dart';
import 'package:familly_apps/features/ auth/domain/repositories/auth_repository.dart';
final sl = GetIt.instance;

Future<void> init() async {
  // 1. On "mappe" Dio (Outil externe)
  sl.registerLazySingleton(() => Dio(
    BaseOptions(
      baseUrl: 'https://reunion-backend-eu5v.onrender.com/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  ));

  // 2. On "mappe" la DataSource
  // On lui injecte Dio en appelant sl()
  sl.registerLazySingleton(() => AuthRemoteDataSource(sl()));

  // 3. On "mappe" le Repository (Contrat -> Implémentation)
  // On lui injecte la DataSource en appelant sl()
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
}