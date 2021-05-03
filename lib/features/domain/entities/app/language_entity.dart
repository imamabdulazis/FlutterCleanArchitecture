import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final String? code;
  final String? value;
  final String? assets;

  const LanguageEntity(
      {required this.code, required this.value, required this.assets});

  @override
  List<Object> get props => [code!, value!, assets!];
}
