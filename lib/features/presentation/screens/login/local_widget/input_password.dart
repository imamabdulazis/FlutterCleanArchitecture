import 'package:clean_architect/core/helper/helper.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.string.password,
        icon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
