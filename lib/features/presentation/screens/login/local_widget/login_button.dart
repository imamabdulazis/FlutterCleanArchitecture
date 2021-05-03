import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    this.title = 'Login',
    this.onPressed,
  }) : super(key: key);

  final String title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FlatButton(
      minWidth: size.width - 40,
      onPressed: () => onPressed!,
      padding: const EdgeInsets.all(15.0),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
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
