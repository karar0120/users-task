import 'package:users_tasks/core/helper/base_use_case.dart';
import 'package:users_tasks/core/networking/api_result.dart';
import 'package:users_tasks/features/users/data/models/get_users_query_params.dart';
import 'package:users_tasks/features/users/domain/entity/users.dart';
import 'package:users_tasks/features/users/domain/repository/users_repo.dart';

class GetUsersUseCase extends BaseUseCase<GetUsersQueryParams, Users> {
  UsersRepository usersRepository;

  GetUsersUseCase({required this.usersRepository});
  @override
  Future<ApiResult<Users>> execute(GetUsersQueryParams input) async {
    return await usersRepository.users(input);
  }
}
