// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: "id")
  int? idProduct;
  @JsonKey(name: "id_cart")
  int? idCart;
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
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Cart({
    this.idProduct,
    this.idCart,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.image,
    this.status,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
