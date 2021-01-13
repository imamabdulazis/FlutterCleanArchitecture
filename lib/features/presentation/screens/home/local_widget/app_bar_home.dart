import 'package:clean_architect/features/presentation/components/utility/palette.dart';
import 'package:clean_architect/features/presentation/components/widget/button_circle.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: const Text(
        'facebook',
        style: TextStyle(
            color: Palette.facebookBlue,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.5),
      ),
      centerTitle: false,
      floating: true,
      actions: <Widget>[
        ButtonCircle(
          icon: Icons.search,
          iconSize: 30.0,
          onPress: () => print('search'),
        ),
        ButtonCircle(
          icon: MdiIcons.facebookMessenger,
          iconSize: 30.0,
          onPress: () => print('messanger'),
        )
      ],
    );
  }
}
