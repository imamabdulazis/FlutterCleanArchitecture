import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const LoginButton({Key key, this.title="Login", this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return FlatButton(
      minWidth: size.width-40,
      onPressed: onPressed,
      padding: const EdgeInsets.all(12.0),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
