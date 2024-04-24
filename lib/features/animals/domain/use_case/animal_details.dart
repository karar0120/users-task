import 'package:pets_finder/core/helper/base_use_case.dart';
import 'package:pets_finder/core/networking/api_result.dart';
import 'package:pets_finder/features/animals/domain/entity/details_animal.dart';
import 'package:pets_finder/features/animals/domain/repository/animals_repo.dart';

class GetAnimalsDetailsUseCase extends BaseUseCase<int, AllAnimalsDetails> {
  AnimalsRepository animalsRepository;

  GetAnimalsDetailsUseCase({required this.animalsRepository});
  @override
  Future<ApiResult<AllAnimalsDetails>> execute(int input) async {
    return await animalsRepository.animalsDetails(input);
  }
}
