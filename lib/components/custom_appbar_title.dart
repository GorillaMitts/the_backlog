import 'package:flutter/material.dart';

class CustomAppbarTitle extends StatelessWidget {
  const CustomAppbarTitle({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'The Backlog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
