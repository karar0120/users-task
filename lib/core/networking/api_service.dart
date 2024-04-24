import 'package:dio/dio.dart';
import 'package:pets_finder/features/animals/data/models/animals_response.dart';
import 'package:pets_finder/features/animals/data/models/details_animal_response_.dart';
import 'package:pets_finder/features/animals/data/models/get_animals_query_params.dart';
import 'package:retrofit/retrofit.dart';

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

  @GET(ApiConstants.animals)
  Future<AnimalsResponse> getAnimals(
    @Queries() GetAnimalsQueryParams getAnimalsQueryParams,
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.animalsDetails)
  Future<AnimalsDetailsResponse> getAnimalsDetails(
    @Path("id") int id,
    @Header("Authorization") String token,
  );
}
