import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String title;
  final Color color;

  const Loader({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black.withOpacity(0.2),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
