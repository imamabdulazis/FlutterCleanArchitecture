import 'package:flutter/material.dart';

class InputEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:const InputDecoration(
        labelText: 'Phone or email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
