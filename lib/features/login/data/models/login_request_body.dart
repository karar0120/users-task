import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String name;
  final String job;
  LoginRequestBody({
    required this.name,
    required this.job,
  });

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
