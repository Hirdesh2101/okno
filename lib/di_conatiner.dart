import 'package:get_it/get_it.dart';
import 'package:okno/application/screens/authentication/cubit/auth_cubit.dart';
import 'package:okno/data/repositories/auth_repository_impl.dart';
import 'package:okno/domain/repositories/auth_repository.dart';
import 'package:okno/domain/usecases/auth_usecases.dart';

final GetIt serviceLocator = GetIt.instance;

void init() {
  // Register data sources

  // Register repositories
  serviceLocator
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // Register use cases
  serviceLocator.registerLazySingleton(() => AuthUseCases(serviceLocator()));

  // Register Cubits
  serviceLocator.registerFactory(() => AuthCubit(serviceLocator()));
}
