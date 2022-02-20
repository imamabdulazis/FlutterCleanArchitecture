import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BottomNavEntity extends Equatable {
  const BottomNavEntity({
    required this.screen,
    required this.title,
    required this.activeIcons,
    required this.defaultIcons,
  });

  final Widget screen;
  final String title;
  final IconData activeIcons;
  final IconData defaultIcons;

  @override
  List<Object?> get props => [
        screen,
        title,
        activeIcons,
        defaultIcons,
      ];
}
