import 'package:clean_architect/features/domain/entities/response/user_model_entity.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends UserModelEntity {
  UserModel({
    @required String? name,
    @required String? imageUrl,
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
