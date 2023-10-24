import 'dart:math';

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

class RandColorContainer extends StatelessWidget {
  const RandColorContainer(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255), Random().nextInt(255)),
      child: child,
    );
  }
}
