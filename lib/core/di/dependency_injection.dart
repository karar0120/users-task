import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_tasks/core/helper/shared_preferences.dart';
import 'package:users_tasks/core/networking/api_service.dart';
import 'package:users_tasks/core/networking/dio_factory.dart';
import 'package:users_tasks/core/networking/netwotk_info.dart';
import 'package:users_tasks/features/login/data/repos/login_repo.dart';
import 'package:users_tasks/features/login/logic/cubit/login_cubit.dart';
import 'package:users_tasks/features/users/data/repos/irepository.dart';
import 'package:users_tasks/features/users/domain/repository/users_repo.dart';
import 'package:users_tasks/features/users/domain/use_case/users.dart';
import 'package:users_tasks/features/users/presentation/controller/cubit/users_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()));

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<AppPreferences>(
      () => AppPreferences(sharedPreferences: getIt()));
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(
      getIt<ApiService>(), getIt<AppPreferences>(), getIt<NetworkInfo>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  //get users

  getIt.registerLazySingleton<UsersRepository>(() => UsersRepo(
        getIt<ApiService>(),
        getIt<AppPreferences>(),
        getIt<NetworkInfo>(),
      ));
}

Future<void> initUsersModule() async {
  if (!GetIt.I.isRegistered<GetUsersUseCase>()) {
    getIt.registerFactory<GetUsersUseCase>(() => GetUsersUseCase(
          usersRepository: getIt(),
        ));
    getIt.registerFactory<UsersCubit>(
        () => UsersCubit(getIt<GetUsersUseCase>()));
  }
}
