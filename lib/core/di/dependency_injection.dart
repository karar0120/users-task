import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pets_finder/core/helper/shared_preferences.dart';
import 'package:pets_finder/core/networking/api_service.dart';
import 'package:pets_finder/core/networking/dio_factory.dart';
import 'package:pets_finder/core/networking/netwotk_info.dart';
import 'package:pets_finder/features/animals/data/repos/irepository.dart';
import 'package:pets_finder/features/animals/domain/repository/animals_repo.dart';
import 'package:pets_finder/features/animals/domain/use_case/animal_details.dart';
import 'package:pets_finder/features/animals/domain/use_case/animals.dart';
import 'package:pets_finder/features/animals/presentation/controller/animal_details_cubit/cubit/animal_details_cubit.dart';
import 'package:pets_finder/features/animals/presentation/controller/cubit/animals_cubit.dart';
import 'package:pets_finder/features/login/data/repos/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //get animals

  getIt.registerLazySingleton<AnimalRepo>(() => AnimalRepo(
        getIt<ApiService>(),
        getIt<AppPreferences>(),
        getIt<NetworkInfo>(),
        getIt<LoginRepo>(),
      ));
  getIt.registerLazySingleton<AnimalsRepository>(() => AnimalRepo(
      getIt<ApiService>(),
      getIt<AppPreferences>(),
      getIt<NetworkInfo>(),
      getIt<LoginRepo>()));
}

Future<void> initAnimalsModule() async {
  if (!GetIt.I.isRegistered<GetAnimalsUseCase>()) {
    getIt.registerFactory<GetAnimalsUseCase>(() => GetAnimalsUseCase(
          animalsRepository: getIt(),
        ));
    getIt.registerFactory<AnimalsCubit>(
        () => AnimalsCubit(getIt<GetAnimalsUseCase>()));
  }
}

Future<void> initAnimalsDetailsModule() async {
  if (!GetIt.I.isRegistered<GetAnimalsDetailsUseCase>()) {
    getIt.registerFactory<GetAnimalsDetailsUseCase>(
        () => GetAnimalsDetailsUseCase(
              animalsRepository: getIt(),
            ));
    getIt.registerFactory<AnimalDetailsCubit>(
        () => AnimalDetailsCubit(getIt<GetAnimalsDetailsUseCase>()));
  }
}
