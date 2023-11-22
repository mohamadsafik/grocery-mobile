// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      idProduct: json['id'] as int?,
      idCart: json['id_cart'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      stock: json['stock'] as int?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      quantity: json['quantity'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.idProduct,
      'id_cart': instance.idCart,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'description': instance.description,
      'image': instance.image,
      'status': instance.status,
      'quantity': instance.quantity,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
