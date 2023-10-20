import 'package:flutter/material.dart';

class FlexibleText extends StatelessWidget {
  const FlexibleText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Text(
      text,
      textAlign: TextAlign.start,
    ));
  }
}
