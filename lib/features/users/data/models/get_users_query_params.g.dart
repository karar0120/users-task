// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersQueryParams _$GetUsersQueryParamsFromJson(Map<String, dynamic> json) =>
    GetUsersQueryParams(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
    );

Map<String, dynamic> _$GetUsersQueryParamsToJson(
        GetUsersQueryParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
    };
