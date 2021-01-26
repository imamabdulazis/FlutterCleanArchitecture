import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
