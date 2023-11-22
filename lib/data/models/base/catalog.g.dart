// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog _$CatalogFromJson(Map<String, dynamic> json) => Catalog(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      stock: json['stock'] as int?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CatalogToJson(Catalog instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'description': instance.description,
      'image': instance.image,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
