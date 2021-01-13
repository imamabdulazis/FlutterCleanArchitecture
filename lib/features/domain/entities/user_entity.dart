import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String imageUrl;

  UserEntity({
    @required this.name,
    @required this.imageUrl,
  });

  @override
  List<Object> get props => [imageUrl,name ];
}
