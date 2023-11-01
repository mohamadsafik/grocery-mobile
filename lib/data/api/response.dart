import 'package:flutter_cubit/engine/engine.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../engine/helpers/converter.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  final String status;

  bool get isSuccess => status == APIResult.success;

  BaseResponse({required this.status});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class ApiResponse<T> extends BaseResponse {
  @Converter()
  final T? articles;

  ApiResponse({
    required String status,
    this.articles,
  }) : super(status: status);

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  factory ApiResponse.onError(BaseResponse error) =>
      ApiResponse(status: error.status);
}

@JsonSerializable()
class ApiResponseList<T> extends BaseResponse {
  @Converter()
  final List<T> articles;

  @JsonKey(name: 'totalResults')
  final int totalData;

  ApiResponseList({
    required String status,
    this.articles = const [],
    this.totalData = 8,
  }) : super(status: status);

  factory ApiResponseList.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResponseListToJson(this);

  factory ApiResponseList.onError(BaseResponse error) =>
      ApiResponseList(status: error.status);
}
