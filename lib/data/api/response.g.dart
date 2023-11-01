// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      status: json['status'] as String,
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) =>
    ApiResponse<T>(
      status: json['status'] as String,
      articles: _$JsonConverterFromJson<Object, T>(
          json['articles'], Converter<T?>().fromJson),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(ApiResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'articles': _$JsonConverterToJson<Object, T>(
          instance.articles, Converter<T?>().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

ApiResponseList<T> _$ApiResponseListFromJson<T>(Map<String, dynamic> json) =>
    ApiResponseList<T>(
      status: json['status'] as String,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => Converter<T>().fromJson(e as Object))
              .toList() ??
          const [],
      totalData: json['totalResults'] as int? ?? 8,
    );

Map<String, dynamic> _$ApiResponseListToJson<T>(ApiResponseList<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'articles': instance.articles.map(Converter<T>().toJson).toList(),
      'totalResults': instance.totalData,
    };
