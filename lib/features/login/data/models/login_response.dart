import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "token_type")
  String? tokenType;
  @JsonKey(name: "expires_in")
  int? expiresIn;
  @JsonKey(name: "access_token")
  String? accessToken;
  LoginResponse({this.tokenType, this.expiresIn, this.accessToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
