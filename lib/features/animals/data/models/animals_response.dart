import 'package:freezed_annotation/freezed_annotation.dart';
part 'animals_response.g.dart';

@JsonSerializable()
class AnimalsResponse {
  List<AnimalsDataResponse>? animals;
  AnimalsResponse({this.animals});

  factory AnimalsResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalsResponseFromJson(json);
}

@JsonSerializable()
class AnimalsDataResponse {
  int? id;
  List<Photos>? photos;
  String? name;
  String? gender;
  String? type;
  AnimalsDataResponse(
      {this.id, this.name, this.gender, this.type, this.photos});

  factory AnimalsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalsDataResponseFromJson(json);
}

@JsonSerializable()
class Photos {
  String? small;
  String? medium;
  String? large;
  String? full;

  Photos({this.small, this.medium, this.large, this.full});

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
}
