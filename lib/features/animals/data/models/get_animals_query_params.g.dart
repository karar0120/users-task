// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_animals_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAnimalsQueryParams _$GetAnimalsQueryParamsFromJson(
        Map<String, dynamic> json) =>
    GetAnimalsQueryParams(
      type: json['type'] as String,
      page: json['page'] as int,
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$GetAnimalsQueryParamsToJson(
        GetAnimalsQueryParams instance) =>
    <String, dynamic>{
      'type': instance.type,
      'page': instance.page,
      'limit': instance.limit,
    };
