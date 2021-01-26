import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class UserModelEntity extends Equatable {
  final String name;
  final String imageUrl;

  UserModelEntity({
    this.name,
    this.imageUrl,
  });

  @override
  List<Object> get props => [imageUrl, name];
}
