import 'package:clean_architect/core/helper/helper.dart';
import 'package:flutter/material.dart';

class InputEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.string.email,
        icon: Icon(Icons.email, color: Theme.of(context).primaryColor),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
