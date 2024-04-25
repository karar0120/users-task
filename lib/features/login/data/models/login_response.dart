import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? id;
  String? name;
  String? job;
  String? createdAt;
  LoginResponse({this.id, this.name, this.job, this.createdAt});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
