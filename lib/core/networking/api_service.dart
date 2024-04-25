import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:users_tasks/features/users/data/models/get_users_query_params.dart';
import 'package:users_tasks/features/users/data/models/users_response.dart';

import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @GET(ApiConstants.users)
  Future<UsersResponse> getUsers(
    @Queries() GetUsersQueryParams getUsersQueryParams,
    @Header("Authorization") String token,
  );
}
