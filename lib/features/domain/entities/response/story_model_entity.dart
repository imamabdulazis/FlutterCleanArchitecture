import 'package:equatable/equatable.dart';

class StoryModelEntity extends Equatable {
  const StoryModelEntity({
    this.user,
    this.imageUrl,
    this.isViewed,
  });

  final dynamic user;
  final String? imageUrl;
  final bool? isViewed;

  @override
  List<Object> get props => [user, imageUrl!, isViewed!];
}
