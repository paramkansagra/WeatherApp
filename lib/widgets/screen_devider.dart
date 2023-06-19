import 'package:flutter/material.dart';

class ScreenDevider extends StatelessWidget {
  ScreenDevider({super.key, required this.color});

  final color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Divider(
            color: color,
          ),
        ),
      ],
    );
  }
}
