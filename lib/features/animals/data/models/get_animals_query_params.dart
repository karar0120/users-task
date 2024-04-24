import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_animals_query_params.g.dart';

@JsonSerializable()
class GetAnimalsQueryParams {
  final String type;
  final int page;
  final int limit;
  GetAnimalsQueryParams(
      {required this.type, required this.page, required this.limit});

  Map<String, dynamic> toJson() => _$GetAnimalsQueryParamsToJson(this);
}
