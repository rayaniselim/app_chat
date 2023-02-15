import 'package:flutter/material.dart';

class TextDataWidget extends StatelessWidget {
  final String date;
  final TextStyle style;
  const TextDataWidget({
    super.key,
    required this.date,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        date,
        style: style,
      ),
    );
  }
}
