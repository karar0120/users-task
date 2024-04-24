// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalsResponse _$AnimalsResponseFromJson(Map<String, dynamic> json) =>
    AnimalsResponse(
      animals: (json['animals'] as List<dynamic>?)
          ?.map((e) => AnimalsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimalsResponseToJson(AnimalsResponse instance) =>
    <String, dynamic>{
      'animals': instance.animals,
    };

AnimalsDataResponse _$AnimalsDataResponseFromJson(Map<String, dynamic> json) =>
    AnimalsDataResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      type: json['type'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimalsDataResponseToJson(
        AnimalsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photos': instance.photos,
      'name': instance.name,
      'gender': instance.gender,
      'type': instance.type,
    };

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      full: json['full'] as String?,
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'full': instance.full,
    };
