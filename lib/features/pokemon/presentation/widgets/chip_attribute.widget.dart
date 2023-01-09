import 'package:flutter/material.dart';

class ChipAttribute extends StatelessWidget {
  final String text;
  const ChipAttribute({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}