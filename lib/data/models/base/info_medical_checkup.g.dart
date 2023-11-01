// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_medical_checkup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoMedicalCheckup _$InfoMedicalCheckupFromJson(Map<String, dynamic> json) =>
    InfoMedicalCheckup(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InfoMedicalCheckupToJson(InfoMedicalCheckup instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
