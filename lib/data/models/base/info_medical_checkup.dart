import 'package:flutter_cubit/data/models/base/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_medical_checkup.g.dart';

@JsonSerializable()
class InfoMedicalCheckup {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "totalResults")
  int? totalResults;
  @JsonKey(name: "articles")
  List<Article>? articles;

  InfoMedicalCheckup({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory InfoMedicalCheckup.fromJson(Map<String, dynamic> json) =>
      _$InfoMedicalCheckupFromJson(json);

  Map<String, dynamic> toJson() => _$InfoMedicalCheckupToJson(this);
}
