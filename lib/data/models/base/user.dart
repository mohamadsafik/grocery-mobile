// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()
class User {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "email")
    String? email;
    @JsonKey(name: "email_verified_at")
    String? emailVerifiedAt;
    @JsonKey(name: "created_at")
    DateTime? createdAt;
    @JsonKey(name: "updated_at")
    DateTime? updatedAt;

    User({
         this.id,
         this.name,
         this.email,
         this.emailVerifiedAt,
         this.createdAt,
         this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}
