


import 'package:clean_architect/features/data/models/response/user_model.dart';
import 'package:flutter/cupertino.dart';

class StoryModel{
  final UserModel user;
  final String imageUrl;
  final bool isViewed;

  const StoryModel({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}