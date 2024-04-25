import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_users_query_params.g.dart';

@JsonSerializable()
class GetUsersQueryParams {
  final int page;
  @JsonKey(name: 'per_page')
  final int perPage;
  GetUsersQueryParams({required this.page, required this.perPage});

  Map<String, dynamic> toJson() => _$GetUsersQueryParamsToJson(this);
}
