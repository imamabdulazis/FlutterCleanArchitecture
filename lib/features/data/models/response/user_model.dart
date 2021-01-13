import 'package:clean_architect/features/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends UserEntity {
  UserModel({
    @required String name,
    @required String imageUrl,
  }) : super(name: name, imageUrl: imageUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      imageUrl: json['image_url']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image_url': imageUrl,
    };
  }
}
