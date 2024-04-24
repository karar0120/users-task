import 'package:pets_finder/core/helper/base_use_case.dart';
import 'package:pets_finder/core/networking/api_result.dart';
import 'package:pets_finder/features/animals/data/models/get_animals_query_params.dart';
import 'package:pets_finder/features/animals/domain/entity/animals.dart';
import 'package:pets_finder/features/animals/domain/repository/animals_repo.dart';

class GetAnimalsUseCase extends BaseUseCase<GetAnimalsQueryParams, Animals> {
  AnimalsRepository animalsRepository;

  GetAnimalsUseCase({required this.animalsRepository});
  @override
  Future<ApiResult<Animals>> execute(GetAnimalsQueryParams input) async {
    return await animalsRepository.animals(input);
  }
}
