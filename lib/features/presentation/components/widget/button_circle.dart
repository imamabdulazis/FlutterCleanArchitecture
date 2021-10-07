import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final Function? onPress;

  const ButtonCircle(
      {Key? key,
        @required this.icon,
        @required this.iconSize,
        @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration:
      BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize!,
        color: Colors.black,
        onPressed: ()=>onPress!,
      ),
    );
  }
}
