import 'package:flutter_cubit/data/models/base/source.dart';
import 'package:json_annotation/json_annotation.dart';

import 'info_medical_checkup.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(name: "source")
  Source? source;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "urlToImage")
  String? urlToImage;
  @JsonKey(name: "publishedAt")
  DateTime? publishedAt;
  @JsonKey(name: "content")
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
