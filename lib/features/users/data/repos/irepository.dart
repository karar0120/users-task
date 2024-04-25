import 'package:users_tasks/core/helper/shared_preferences.dart';
import 'package:users_tasks/core/networking/api_error_handler.dart';
import 'package:users_tasks/core/networking/api_result.dart';
import 'package:users_tasks/core/networking/api_service.dart';
import 'package:users_tasks/core/networking/netwotk_info.dart';
import 'package:users_tasks/features/users/data/mapper/users_mapper.dart';
import 'package:users_tasks/features/users/data/models/get_users_query_params.dart';
import 'package:users_tasks/features/users/domain/entity/users.dart';
import 'package:users_tasks/features/users/domain/repository/users_repo.dart';

class UsersRepo implements UsersRepository {
  final ApiService _apiService;
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;
  UsersRepo(
    this._apiService,
    this._appPreferences,
    this._networkInfo,
  );

  @override
  Future<ApiResult<Users>> users(
      GetUsersQueryParams getUsersQueryParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getUsers(
            getUsersQueryParams, "Bearer ${_appPreferences.getAccessToken()}");
        return ApiResult.success(response.toDomain());
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
  }
}
