import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {

  LabelText(this.title, this.padding);

  final String title;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white
      ),
    );
  }
}
