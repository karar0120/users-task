import 'package:pets_finder/core/helper/shared_preferences.dart';
import 'package:pets_finder/core/networking/api_error_handler.dart';
import 'package:pets_finder/core/networking/api_result.dart';
import 'package:pets_finder/core/networking/api_service.dart';
import 'package:pets_finder/core/networking/netwotk_info.dart';
import 'package:pets_finder/features/animals/data/mapper/animal_details_mapper.dart';
import 'package:pets_finder/features/animals/data/mapper/animals_mapper.dart';
import 'package:pets_finder/features/animals/data/models/get_animals_query_params.dart';
import 'package:pets_finder/features/animals/domain/entity/animals.dart';
import 'package:pets_finder/features/animals/domain/entity/details_animal.dart';
import 'package:pets_finder/features/animals/domain/repository/animals_repo.dart';
import 'package:pets_finder/features/login/data/repos/login_repo.dart';

class AnimalRepo implements AnimalsRepository {
  final ApiService _apiService;
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;
  final LoginRepo _loginRepo;
  AnimalRepo(this._apiService, this._appPreferences, this._networkInfo,
      this._loginRepo);

  @override
  Future<ApiResult<Animals>> animals(
      GetAnimalsQueryParams getAnimalsQueryParams) async {
    if (await _networkInfo.isConnected) {
      try {
        if (_appPreferences.checkTokenExpire() != true) {
          final response = await _apiService.getAnimals(getAnimalsQueryParams,
              "Bearer ${_appPreferences.getAccessToken()}");
          return ApiResult.success(response.toDomain());
        } else {
          await _loginRepo.login();
          final response = await _apiService.getAnimals(getAnimalsQueryParams,
              "Bearer ${_appPreferences.getAccessToken()}");
          return ApiResult.success(response.toDomain());
        }
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
  }

  @override
  Future<ApiResult<AllAnimalsDetails>> animalsDetails(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        if (_appPreferences.checkTokenExpire() != true) {
          final response = await _apiService.getAnimalsDetails(
              id, "Bearer ${_appPreferences.getAccessToken()}");
          return ApiResult.success(response.toDomain());
        } else {
          await _loginRepo.login();
          final response = await _apiService.getAnimalsDetails(
              id, "Bearer ${_appPreferences.getAccessToken()}");
          return ApiResult.success(response.toDomain());
        }
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
  }
}
