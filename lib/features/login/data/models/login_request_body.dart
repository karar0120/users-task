import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  @JsonKey(name: "grant_type")
  final String grantType;
  @JsonKey(name: "client_id")
  final String clientId;
  @JsonKey(name: "client_secret")
  final String clientSecret;
  LoginRequestBody(
      {required this.grantType,
      required this.clientId,
      required this.clientSecret});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
