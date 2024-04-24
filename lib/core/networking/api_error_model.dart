import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel extends Equatable {
  final String? title;
  final int? status;
  final String? details;
  const ApiErrorModel({required this.title, this.status, this.details});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  @override
  List<Object?> get props => [
        title,
        details,
        status,
      ];
}
