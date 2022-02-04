import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  const LanguageEntity({
    required this.code,
    required this.value,
    required this.assets,
  });

  final String? code;
  final String? value;
  final String? assets;

  @override
  List<Object> get props => [code!, value!, assets!];
}
