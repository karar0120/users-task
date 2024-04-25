import 'package:users_tasks/core/helper/constances.dart';
import 'package:users_tasks/core/helper/shared_preferences.dart';
import 'package:users_tasks/core/networking/api_error_handler.dart';
import 'package:users_tasks/core/networking/api_result.dart';
import 'package:users_tasks/core/networking/api_service.dart';
import 'package:users_tasks/core/networking/netwotk_info.dart';
import 'package:users_tasks/features/login/data/models/login_request_body.dart';
import 'package:users_tasks/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;
  LoginRepo(this._apiService, this._appPreferences, this._networkInfo);

  Future<ApiResult<LoginResponse>> login() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.login(
          LoginRequestBody(
              grantType: Constances.clientCredentials,
              clientId: "",
              clientSecret: ""),
        );

        await _appPreferences.setAccessToken(
            accessToken: response.accessToken!);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
  }
}
