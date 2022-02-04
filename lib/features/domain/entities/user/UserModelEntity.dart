import 'package:equatable/equatable.dart';

class UserModelEntity extends Equatable {
  const UserModelEntity({
    this.name,
    this.imageUrl,
  });

  final String? name;
  final String? imageUrl;

  @override
  List<Object> get props => [imageUrl!, name!];
}
