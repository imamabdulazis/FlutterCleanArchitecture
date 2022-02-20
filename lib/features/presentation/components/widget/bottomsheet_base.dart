import 'package:flutter/material.dart';

class BottomSheetBase extends StatelessWidget {
  const BottomSheetBase({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: 70,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child!,
        ],
      ),
    );
  }
}
