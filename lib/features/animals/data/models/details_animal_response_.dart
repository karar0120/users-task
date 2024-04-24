import 'package:json_annotation/json_annotation.dart';
part 'details_animal_response_.g.dart';

@JsonSerializable()
class AnimalsDetailsResponse {
  @JsonKey(name: 'animal')
  AnimalsDataDetailsResponse? animalsDataDetailsResponse;
  AnimalsDetailsResponse({this.animalsDataDetailsResponse});
  factory AnimalsDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalsDetailsResponseFromJson(json);
}

@JsonSerializable()
class AnimalsDataDetailsResponse {
  int? id;
  List<PhotosDetailsResponse>? photos;
  String? name;
  String? size;
  String? url;
  Contact? contact;
  Colors? colors;
  AnimalsDataDetailsResponse(
      {this.id,
      this.name,
      this.size,
      this.url,
      this.photos,
      this.contact,
      this.colors});

  factory AnimalsDataDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalsDataDetailsResponseFromJson(json);
}

@JsonSerializable()
class PhotosDetailsResponse {
  String? small;
  String? medium;
  String? large;
  String? full;

  PhotosDetailsResponse({this.small, this.medium, this.large, this.full});

  factory PhotosDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotosDetailsResponseFromJson(json);
}

@JsonSerializable()
class Contact {
  Address? address;

  Contact({this.address});
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

@JsonSerializable()
class Address {
  String? city;
  String? state;
  String? postcode;
  String? country;

  Address({this.city, this.state, this.postcode, this.country});
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@JsonSerializable()
class Colors {
  String? primary;

  Colors({this.primary});
  factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);
}
