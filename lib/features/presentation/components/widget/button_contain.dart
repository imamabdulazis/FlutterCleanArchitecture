import 'package:clean_architect/features/presentation/components/utility/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum buttonColor{
  primary,
  success,
  warning,
  danger
}

enum titleColor{
  light,
  dark
}

class ButtonContain extends StatelessWidget {
  final String title;
  final Color buttonColors;
  final Color titleColors;
  final Function onPressed;

  // ignore: sort_constructors_first
  const ButtonContain({
    Key key,
    this.title = 'Login',
    this.buttonColors,
    this.titleColors,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FlatButton(
      minWidth: size.width - 40,
      onPressed: onPressed,
      padding: const EdgeInsets.all(15.0),
      color:buttonColors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              color: titleColors,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }
}
