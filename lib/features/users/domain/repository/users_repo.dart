import 'package:users_tasks/core/networking/api_result.dart';
import 'package:users_tasks/features/users/data/models/get_users_query_params.dart';
import 'package:users_tasks/features/users/domain/entity/users.dart';

abstract class UsersRepository {
  Future<ApiResult<Users>> users(GetUsersQueryParams getUsersQueryParams);
}
