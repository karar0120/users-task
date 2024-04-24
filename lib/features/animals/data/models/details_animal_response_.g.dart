// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_animal_response_.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalsDetailsResponse _$AnimalsDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    AnimalsDetailsResponse(
      animalsDataDetailsResponse: json['animal'] == null
          ? null
          : AnimalsDataDetailsResponse.fromJson(
              json['animal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalsDetailsResponseToJson(
        AnimalsDetailsResponse instance) =>
    <String, dynamic>{
      'animal': instance.animalsDataDetailsResponse,
    };

AnimalsDataDetailsResponse _$AnimalsDataDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    AnimalsDataDetailsResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      url: json['url'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map(
              (e) => PhotosDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      colors: json['colors'] == null
          ? null
          : Colors.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalsDataDetailsResponseToJson(
        AnimalsDataDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photos': instance.photos,
      'name': instance.name,
      'size': instance.size,
      'url': instance.url,
      'contact': instance.contact,
      'colors': instance.colors,
    };

PhotosDetailsResponse _$PhotosDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PhotosDetailsResponse(
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      full: json['full'] as String?,
    );

Map<String, dynamic> _$PhotosDetailsResponseToJson(
        PhotosDetailsResponse instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'full': instance.full,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'address': instance.address,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      city: json['city'] as String?,
      state: json['state'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
    };

Colors _$ColorsFromJson(Map<String, dynamic> json) => Colors(
      primary: json['primary'] as String?,
    );

Map<String, dynamic> _$ColorsToJson(Colors instance) => <String, dynamic>{
      'primary': instance.primary,
    };
