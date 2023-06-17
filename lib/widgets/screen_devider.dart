import 'package:flutter/material.dart';

class ScreenDevider extends StatelessWidget {
  const ScreenDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
