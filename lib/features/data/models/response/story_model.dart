import 'user_model.dart';

class StoryModel {
  const StoryModel({
    this.user,
    this.imageUrl,
    this.isViewed = false,
  });

  final UserModel? user;
  final String? imageUrl;
  final bool? isViewed;
}
