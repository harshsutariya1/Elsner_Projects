import 'package:flutter/material.dart';

class ElsnerLogo extends StatelessWidget {
  const ElsnerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "UN",
          style: TextStyle(
            shadows: [
              Shadow(
                  color: Color.fromARGB(255, 209, 140, 140),
                  offset: Offset(1.0, 5.0),
                  blurRadius: 5)
            ],
            decoration: TextDecoration.underline,
            decorationColor: Colors.black,
            decorationThickness: 2,
            color: Colors.red,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "BIND",
          style: TextStyle(
            shadows: [
              Shadow(
                  color: Color.fromARGB(255, 109, 92, 92),
                  offset: Offset(1, 5),
                  blurRadius: 5)
            ],
            decoration: TextDecoration.overline,
            decorationColor: Colors.red,
            decorationThickness: 2,
            color: Colors.black,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
