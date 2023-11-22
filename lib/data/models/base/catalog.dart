import 'package:json_annotation/json_annotation.dart';

part 'catalog.g.dart';

@JsonSerializable()
class Catalog {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Catalog({
    this.id,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogToJson(this);
}
