import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  @JsonKey(name: 'data')
  List<UsersDataResponse>? users;
  UsersResponse({this.users});

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);
}

@JsonSerializable()
class UsersDataResponse {
  int? id;
  String? email;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? avatar;
  UsersDataResponse(
      {this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UsersDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersDataResponseFromJson(json);
}
