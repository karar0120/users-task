import 'package:users_tasks/core/networking/api_result.dart';

abstract class BaseUseCase<In, Out> {
  Future<ApiResult<Out>> execute(In input);
}
